require 'gossip'

class GossipProjectApp < Sinatra::Base
	# cette nouvelle classe hérite de la classe Sinatra::Base
	get '/'  do	
  		erb :index, locals: {gossips: Gossip.all, id: Gossip.find(params[:id])}
  		# si utilisateur va sur url /, afficher page index
  		# locals => on définit des variables utilisables dans du html grâce à surcouche .erb
	end

	get '/gossips/new' do
		erb :new_gossip	
		# si utilisateur va sur l'url gossip/new, afficher la page new_gossip
	end

	post '/gossips/new' do
		  Gossip.new(params["gossip_author"], params["gossip_content"]).save
		  # création d'une nouvelle instance de la classe Gossip avec deux arguments (nécessaires pour la méthode initialize)
		  # sur laquelle on applique la méthode save qui enregistre gossip + auteur dans un tableau
		  puts "Ajout du gossip dans un fichier CSV"
		  # ca s'affiche dans le terminal
		  redirect '/'
		  # une fois le formulaire envoyé, l'utilisateur est redirigé sur la page d'accueil
	end

	get '/gossips/:id' do 
		# permet en 1 ligne de générer plusieurs url, ici gossips/[un nombre]
		puts Gossip.find(params[:id])
		# on applique la méthode de classe find à la classe Gossip pour rechercher les gossips dans le CSV
		puts "Le gossip recherché est le numéro #{params[:id]}"
		# s'affiche dans le terminal
		erb :gossip_page, locals: {gossips: Gossip.all, id: Gossip.find(params[:id])}
		# si utilisateur va sur url, afficher page gossip page
		# locals => on définit des variables utilisables dans la page html grâce a ERB
	end

	#run! if app_file == $0
	# équivalent pour Sinatra de 'faire marcher l'application'
	# équivaut à MaClasse.new.perform
end