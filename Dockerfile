# Linux Alpine + node (-v 14)
FROM node:19.5.0-alpine 

# Рабочая директория
WORKDIR /app

# Копирование package .json и package-Lock.json в контейнер
COPY package*.json ./

# устанавливаем зависимости
RUN npm install

# Копируем остальное приложение в контейнер
COPY . .

# Устанавливаем глобально Prisma
RUN npm install -g prisma

# Генерируем prisma-client
RUN prisma generate

# Копируюем папку призма
COPY prisma/schema.prisma ./prisma/

# Открываем порт для связи с контейнером
EXPOSE 3000

# Внутри контейнера запускаем наш сервер
CMD ["npm","start"]