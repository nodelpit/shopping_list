# Classe qui représente une liste de courses individuelle
class ShoppingList
  attr_reader :name, :items
  attr_writer :name

  # Initialise une nouvelle liste avec un nom et un tableau vide d'articles
  def initialize(name)
    @name = name
    @items = []
  end
end

# Classe principale qui gère toutes les listes de courses
class ShoppingListManager

   # Initialise le gestionnaire avec un tableau vide pour stocker les listes
  def initialize
    @lists = []
  end

   # Affiche le menu principal avec toutes les options disponibles
  def display_menu
    puts "==== MENU PRINCIPAL ===="
    puts "[1] Créer une nouvelle liste"
    puts "[2] Afficher les listes existantes"
    puts "[3] Sélectionner une liste"
    puts "[4] Quitter le programme"
  end

  # Vérifie si une autre list existe avec le meme nom
  def list_exists?(list_name)
    @lists.any? { |list| list.name == list_name }
  end

   # Démarre l'application et gère la boucle principale d'interaction
  def start
    loop do
      display_menu
      choice = gets.chomp.to_i
       # Gestion des différentes options choisies par l'utilisateur
      case choice
      when 1
        puts "[+] Veuillez donnez un nom à cette liste"
        list_name = gets.chomp

        if list_exists?(list_name)
          puts "[!] Cette liste existe déjà !"
        else
          new_list = ShoppingList.new(list_name)
          @lists << new_list
          puts "[!] Votre liste à bien été enregistré !"
        end
      when 2
      when 3
      when 4
        puts "À bientôt"
        break
      else
        puts "Je ne suis pas sur de CoπPr&nDr€"
      end
    end
  end
end

# Création et lancement de l'application
manager = ShoppingListManager.new
manager.start
