
require_relative 'class_joueur'
require_relative 'class_tableau'

class Morpion
  
  def initialize
    
    # Mettre en place le tableau
    @tableau = Tableau.new
    
    
    
    # Mettre en place les joueurs
    @joueur_x = Joueur.new("Marine", :x, @tableau)
    @joueur_y = Joueur.new("immigré", :o, @tableau)
    # Assigner le joueur de départ
    @joueur_actuel = @joueur_x
  end
  
  
  # jouer
  def jouer
    loop do
      # Appelez la variable d'instance @tableau
      @tableau.retourne_etat_du_tableau
      # Demande les coordonnées du joueur actuel
      @joueur_actuel.recuperer_position_case
      # Interrompt la boucle SI le jeu est terminé
      break if perdu
      # Changer de joueur
      switch_joueur
    end
  end
  # perdu
  def perdu
 
    victoire || match_nul
  end
  
  
  # victoire
  def victoire
    # la condition IF indique si le symbole du joueur actuel a
    # Une combinaison gagnante ?
    #(class Tableau method combinaison_gagnante)
    if @tableau.combinaison_gagnante?(@joueur_actuel.picto)
      # Affiche un message de victoire
      @tableau.retourne_etat_du_tableau
      puts "Félicitation #{@joueur_actuel.nom}, vous avez gagné !"
      true
    else
      false
    end
  end
  
  
  # match_nul
  def match_nul
    # SI la class Tableau nous retourne que le tableau est complet
    if @tableau.complet?
      # Afficher un message de tirage
      puts "Pas de chance, match nul"
      true
    else
      false
    end
  end
  
  
  # switch_joueur
  def switch_joueur
    # joueur_x >> joueur_y vice versa
    if @joueur_actuel == @joueur_x
      @joueur_actuel = @joueur_y
    else
      @joueur_actuel = @joueur_x
    end
  end
  
  #FIN
end
