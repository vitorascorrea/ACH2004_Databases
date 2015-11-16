class AlunoController < ApplicationController
	def new
		@aluno = Aluno.new
	end
	 def create
    @aluno = Aluno.new(aluno_params)
		if @aluno.save
			if params[:tipo] == 'Grad'
				redirect_to new_aluno_graduacao_path(:cpf => params[:aluno][:cpf])
			elsif
				redirect_to new_aluno_pos_path(:cpf => params[:aluno][:cpf])
			end
		else
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
