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

  # Affiche le menu des choix possibles pour interagir avec une liste
  def display_list_menu
    puts "==== APPORTEZ VOS MODIFICATIONS POUR LA LISTE SELECTIONNÉ ===="
    puts "[1] Ajouter un article"
    puts "[2] Retirer un article"
    puts "[3] Afficher les articles"
    puts "[4] Retourner au menu principal"
  end

  # Vérifie si une autre list existe avec le meme nom
  def list_exists?(list_name)
    @lists.any? { |list| list.name == list_name }
  end

  # Vérifie si des listes existent
  def display_lists
    if @lists.empty?
      puts "[!] Aucune liste n'existe pour le moment"
    else
      puts "Vos listes :"
      @lists.each_with_index do |list, index|
        puts "#{index + 1}. #{list.name}"
      end
    end
  end

  # Demande a l'utilisateur de séléctionner une liste et affiche le menu de la méthode display_list_menu
  def select_list
    puts "[+] Séléctionner une liste :"
    display_lists
    list_choice = gets.chomp.to_i

    if list_choice > 0 && list_choice <= @lists.length
      selected_list = @lists[list_choice - 1]
      handle_list_menu(selected_list)
    end
  end

  #  Gère les actions sur la liste sélectionnée
  def handle_list_menu(selected_list)
    loop do
      display_list_menu
      choice = gets.chomp.to_i

      case choice
      when 1
        puts "[+] Veuillez ajoutez un article :"
        pushed_article = gets.chomp
        selected_list.items << pushed_article
        puts "[!] Article bien enregistré dans #{selected_list.name}"
      when 2
        puts "[+] Voici vos articles :"
        selected_list.items.each_with_index do |item, index|
          puts "#{index + 1}. #{item}"
         end
         puts "[+] Choisissez le numéro de l'article à retirer :"
         item_choice = gets.chomp.to_i
         if item_choice > 0 && item_choice <= selected_list.items.length
          selected_list.items.delete_at(item_choice - 1)
          puts "[!] Article supprimé avec succès !"
         else
          puts "[!] Numéro d'article !nV@lid€"
         end
        when 3
          if selected_list.items.empty?
            puts "[!] Aucun article dans cette liste"
          else
           puts "[+] Voici vos articles :"
            selected_list.items.each_with_index do |item, index|
              puts "#{index + 1}. #{item}"
            end
          end
        when 4
          puts "<-- Retour au menu principal"
          break
        else
          puts "[!] Choix !nV@lid€ !"
      end
    end
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
        display_lists
      when 3
        select_list
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
