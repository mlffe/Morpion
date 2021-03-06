require_relative 'class_joueur'

class Tableau
  def initialize
    @tableau = Array.new(3){Array.new(3)}
  end
  
  # retourne_etat_du_tableau
  def retourne_etat_du_tableau
    puts
    # itère (each do) sur la structure de donnée
    @tableau.each do |ligne|
      ligne.each do |cellule|
        #Afficher un marqueur existant, SI il existe SINON vide
        cellule.nil? ? print("-") : print(cellule.to_s)
      end
      puts
    end
    puts
  end
  
  
  # ajouter_un_picto
  def ajouter_un_picto(position, picto)
    # SI case_souhaite_est_valide ?
    if case_souhaite_est_valide?(position)
      # place le marqueur
      @tableau[position[0]][position[1]] = picto
      true
      # SINON
    else
      # Message d'erreur
      false
    end
  end
  
  
  # case_souhaite_est_valide ?
  def case_souhaite_est_valide?(position)
    # coordonnee_valide
    if coordonnee_valide?(position)
      # case_non_occupee ?
      case_disponible?(position)
    end
  end
  
  # coordonnee_valide ?
  def coordonnee_valide?(position)
    # limite 3 X 3
    if (0..2).include?(position[0]) && (0..2).include?(position[1])
      true
      # SINON Message d'erreur d'affichage
    else
      puts "la case demandée est hors limite"
    end
  end
  
  # case_disponible ?
  def case_disponible?(position)
    # À MOINS QUE la case sur le tableau ne soit occupée
    if @tableau[position[0]][position[1]].nil?
      true
      # SINON Affiche un message d'erreur
    else
      puts "La case est déjà occupée"
    end
  end
  
  
  # diagonale
  def diagonale
    # Retourner les pictos sur la diagonale
    [[ @tableau[0][0],@tableau[1][1],@tableau[2][2] ],
    [ @tableau[2][0],@tableau[1][1],@tableau[0][2] ]]
  end
  
  def verticale

    @tableau
  end
  
  def horizontale

    horizontale = []
    3.times do |i|
      horizontale << [@tableau[0][i],@tableau[1][i],@tableau[2][i]]
    end
    horizontale
  end
  
  def complet?

    @tableau.all? do |ligne|
      ligne.none?(&:nil?)
    end
  end
  
  def combinaison_gagnante?(picto)

    victoire_diagonale?(picto) ||
    victoire_horizontale?(picto) ||
    victoire_verticale?(picto)
  end
  
  def victoire_diagonale?(picto)
    diagonale.any? do |diag|
      diag.all?{|cellule| cellule == picto }
    end
  end
  
  def victoire_verticale?(picto)
    verticale.any? do |vert|
      vert.all?{|cellule| cellule == picto }
    end
  end
  
  def victoire_horizontale?(picto)
    horizontale.any? do |horiz|
      horiz.all?{|cellule| cellule == picto }
    end
  
  end
end
