#!/bin/sh

npx prisma migrate reset --force

npm run dev