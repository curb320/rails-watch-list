require 'nokogiri'
require 'open-uri'


class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def fetch_movie
    api_key = 'votre_cle_api' # Remplacez par votre clé API OMDb
    movie_title = 'Inception' # Exemple : Nom du film
    url = "http://www.omdbapi.com/?apikey=#{api_key}&t=#{URI.encode(movie_title)}"

    response = HTTParty.get(url)

    if response.success?
      @movie_data = JSON.parse(response.body) # Parse le JSON de la réponse
    else
      @error = "Impossible de récupérer les informations du film."
    end
  end

  def get_movie_poster(imdb_url)
    # Charge la page IMDb
    html_content = URI.open(imdb_url).read
    doc = Nokogiri::HTML(html_content)

    # Sélectionne l'élément contenant l'image (ajustez le sélecteur si IMDb change son HTML)
    image_element = doc.at_css('meta[property="og:image"]')

    # Retourne l'URL de l'image
    image_element['content'] if image_element
  rescue StandardError => e
    Rails.logger.error("Erreur lors du scraping IMDb : #{e.message}")
    nil # Retourne nil si une erreur se produit
  end



end
