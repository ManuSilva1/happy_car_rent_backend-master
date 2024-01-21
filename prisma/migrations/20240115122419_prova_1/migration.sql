-- CreateTable
CREATE TABLE "Loja" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "intruction" TEXT NOT NULL,
    "morada" TEXT NOT NULL,
    "imagem" TEXT NOT NULL,

    CONSTRAINT "Loja_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Frota" (
    "id" SERIAL NOT NULL,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "motor" TEXT NOT NULL,
    "potencia" TEXT NOT NULL,
    "transmissao" TEXT NOT NULL,
    "combustivel" TEXT NOT NULL,
    "capacidade" TEXT NOT NULL,
    "preco" DOUBLE PRECISION NOT NULL,
    "imagem" TEXT NOT NULL,

    CONSTRAINT "Frota_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CarroLoja" (
    "id" SERIAL NOT NULL,
    "lojaId" INTEGER NOT NULL,
    "carroId" INTEGER NOT NULL,

    CONSTRAINT "CarroLoja_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CarroLoja_lojaId_carroId_key" ON "CarroLoja"("lojaId", "carroId");

-- AddForeignKey
ALTER TABLE "CarroLoja" ADD CONSTRAINT "CarroLoja_lojaId_fkey" FOREIGN KEY ("lojaId") REFERENCES "Loja"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CarroLoja" ADD CONSTRAINT "CarroLoja_carroId_fkey" FOREIGN KEY ("carroId") REFERENCES "Frota"("id") ON DELETE RESTRICT ON UPDATE CASCADE;