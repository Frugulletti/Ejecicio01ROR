class Article < ActiveRecord::Base
#dependent: :destroy Elimina los comentarios que posea al ser eliminado el articulo	
	has_many :comments, dependent: :destroy
	validates :title, presence: true,
                    length: { minimum: 5 }
end

