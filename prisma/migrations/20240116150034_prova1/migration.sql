/*
  Warnings:

  - You are about to drop the column `intruction` on the `Loja` table. All the data in the column will be lost.
  - Added the required column `categoria` to the `Frota` table without a default value. This is not possible if the table is not empty.
  - Added the required column `instructions` to the `Loja` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Frota" ADD COLUMN     "categoria" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Loja" DROP COLUMN "intruction",
ADD COLUMN     "instructions" TEXT NOT NULL;