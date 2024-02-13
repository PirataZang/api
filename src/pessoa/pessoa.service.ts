import { Injectable } from '@nestjs/common';
import { CreatePessoaDto } from './dto/create-pessoa.dto';
import { UpdatePessoaDto } from './dto/update-pessoa.dto';
import { PrismaService } from 'src/database/PrismaService';

@Injectable()
export class PessoaService {

  constructor (private prisma: PrismaService) {}

  create(createPessoaDto: CreatePessoaDto) {
    const Pessoa = this.prisma.pessoa.create({data: createPessoaDto});
    return Pessoa;
  }

  findAll() {
    return this.prisma.pessoa.findMany();
  }

  findOne(id: number) {
    return this.prisma.pessoa.findUnique({where: {pes_id: Number(id)}})
  }

  findOnebyName(name: String) {
    return this.prisma.pessoa.findFirst({where: {pes_nome: String(name)}})
  }

  update(id: number, updatePessoaDto: UpdatePessoaDto) {
    const UpdatePessoa = this.prisma.pessoa.update({where: {pes_id: Number(id)}, data: updatePessoaDto });
    return UpdatePessoa;
  }

  remove(id: number) {
    return this.prisma.pessoa.delete({where: {pes_id: Number(id)}})
  }
}
