#!/bin/bash
echo "--- Starting site refresh ---"

# 1. Загружаем свежие изменения из GitHub (то, что сохранила Тина)
cd /var/www/my-website
git pull origin main

# 2. Собираем Тину
CI=true NODE_OPTIONS="--max-old-space-size=2048" npx tinacms build

# 3. Собираем сам сайт (Eleventy)
npm run build

# 4. Перезапускаем сервер
pm2 restart all || pm2 start npm --name "halide-site" -- start

echo "--- ЗАЕБИСЬ ПРОШЛО | SUCCESS | ОБНОВИЛИ КОНТЕНТ ---"
