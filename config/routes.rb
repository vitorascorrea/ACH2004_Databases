Rails.application.routes.draw do

  root 'controlador#home'
	resources :aluno
	resources :aluno_graduacao
	resources :aluno_pos
end
