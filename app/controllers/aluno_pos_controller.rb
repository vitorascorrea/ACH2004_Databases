class AlunoPosController < ApplicationController
	def new
		@aluno_pos = AlunoPos.new
		@pesquisa = ProjetoPesquisa.all
	end
	def create
		@aluno_pos = AlunoPos.new(aluno_params)
		if @aluno_pos.save
		  redirect_to root_url
		else
		  redirect_to new_aluno_path
		end
  end
 
  private
    def aluno_params
      params.require(:aluno_pos).permit(:cpf, :isento, :data_inicio, :id_curso, :semestre_atual, :id_projeto)
    end
end
