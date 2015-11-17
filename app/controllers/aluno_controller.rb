class AlunoController < ApplicationController
	def new
		@aluno = Aluno.new
	end
	def create
    @aluno = Aluno.new(aluno_params)
			if Aluno.where(cpf: params[:aluno][:cpf]).blank?
					@aluno.save
					redirect_to new_aluno_graduacao_path(:cpf => params[:aluno][:cpf])
			else
				flash[:warning] = "CPF já cadastrado."
		    redirect_to new_aluno_path
			end
	end
	def index
		@aluno = Aluno.all	
	end
 
  private
    def aluno_params
      params.require(:aluno).permit(:cpf, :nome, :nascimento, :rg, :sexo)
    end
end
