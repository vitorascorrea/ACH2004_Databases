class AlunoGraduacaoController < ApplicationController
	def new
		@aluno_grad = AlunoGraduacao.new
	end
	def create
		@aluno_grad = AlunoGraduacao.new(aluno_params)
		if @aluno_grad.save
		  redirect_to root_url
		else
		  redirect_to new_aluno_path
		end
  end
 
  private
    def aluno_params
      params.require(:aluno_graduacao).permit(:cpf, :isento, :data_inicio, :id_curso, :semestre_atual)
    end
end
