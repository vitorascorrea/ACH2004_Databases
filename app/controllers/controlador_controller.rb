class ControladorController < ApplicationController
	def home
		@alunos = Aluno.all
	end
end
