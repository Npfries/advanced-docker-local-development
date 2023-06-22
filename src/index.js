import express from "express";
const app = express();
import { PrismaClient } from "@prisma/client";

const PORT = process.env.PORT ?? 3000;

app.get("/", (req, res) => {
  const prisma = new PrismaClient();
  prisma.$connect();
  prisma.$disconnect();
  res.send("Hello, World!");
});

app.get("/healthcheck", (req, res) => {
  res.send({ health: "healthy" });
});

app.listen(PORT);
console.log(`App listening on port: ${PORT}`);
