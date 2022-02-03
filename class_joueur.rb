require_relative 'class_tableau'

class Joueur
  attr_accessor :nom, :picto
  
  def initialize(nom, picto, tableau)
   
    raise "Le pictogramme est incorrecte" unless picto.is_a?(Symbol)
    @nom = nom
    @picto = picto
    @tableau = tableau
  
  end
  
  def recuperer_position_case
    # Loop
    loop do
      # interroger la position
      position = demander_position_case
      # SI format est OK (IF … TRUE)
      if position_valide(position)
        if @tableau.ajouter_un_picto(position, @picto)
          break
        end
      end
    end
  end
  
  
  # demander_position_case
  def demander_position_case
    # Affiche un message demandant la position
    puts"#{@nom}(#{@picto}), cocher la case - saisir les coordonnées (x, y) :
    allant de 0 à 2 - exemple : 0,1 positionnera votre pictogramme sur la 
    première ligne 2ème case"

    gets.strip.split(",").map(&:to_i)
  end
  
  
  # position valide
  def position_valide(position)

    
    if position.is_a?(Array) && position.size == 2
      true
    else
      # Message d'erreur d'affichage
      puts "La saisie de la position n'est pas au format attendu !"
    end
  end
  
end
