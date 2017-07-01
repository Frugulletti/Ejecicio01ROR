class ArticlesController < ApplicationController
#Indicamos que quereos proteger todas las acciones salvao index y show:
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def new
		@article = Article.new
	end

	def create #Crear un nuevo registro
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article	
		else
			render :new
		end
		
	end
    

	def edit #Editarlo
		@article = Article.find (params[:id])
	end

	def show #Mostrarlo
  		@article = Article.find(params[:id])
	end

	def index #Cargar la lista completa
	  @articles = Article.all
	end

	def update #Actualizar o modificar el registro
	  @article = Article.find(params[:id])
	 
	  if @article.update(article_params)
	    redirect_to @article
	  else
	    render 'edit'
	  end
	end
	
	def destroy #Eliminar el registro
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end


	private

  	def article_params
    	params.require(:article).permit(:title, :text)
  	end

end
