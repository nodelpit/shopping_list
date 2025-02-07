require "colorize"

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
    puts "==== MENU PRINCIPAL ====".blue
    puts "[#{1}] ".yellow + "Créer une nouvelle liste"
    puts "[#{2}] ".yellow + "Afficher les listes existantes"
    puts "[#{3}] ".yellow + "Sélectionner une liste"
    puts "[#{4}] ".yellow + "Quitter le programme"
  end

  # Affiche le menu des choix possibles pour interagir avec une liste
  def display_list_menu
    puts "==== APPORTEZ VOS MODIFICATIONS POUR LA LISTE SELECTIONNÉ ====".blue
    puts "[#{1}] ".yellow + "Ajouter un article"
    puts "[#{2}] ".yellow + "Retirer un article"
    puts "[#{3}] ".yellow + "Afficher les articles"
    puts "[#{4}] ".yellow + "Retourner au menu principal"
  end

  # Vérifie si une autre list existe avec le meme nom
  def list_exists?(list_name)
    @lists.any? { |list| list.name == list_name }
  end

  # Vérifie si des listes existent
  def display_lists
    if @lists.empty?
      puts "[!] Aucune liste n'existe pour le moment".red
    else
      puts "Vos listes :".green
      @lists.each_with_index do |list, index|
        puts "#{index + 1}. ".yellow + "#{list.name}".cyan
      end
    end
  end

  # Demande a l'utilisateur de séléctionner une liste et affiche le menu de la méthode display_list_menu
  def select_list
    puts "[+] Séléctionner une liste :".green
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
        puts "[+] Veuillez ajoutez un article :".green
        pushed_article = gets.chomp

        if pushed_article.strip.empty?
          puts "[!] L'article ne peut pas être vide !".red
        else
          selected_list.items << pushed_article
          puts "[!] Article bien enregistré dans ".green + "#{selected_list.name}".cyan
        end
      when 2
        puts "[+] Voici vos articles :".green
        selected_list.items.each_with_index do |item, index|
          puts "#{index + 1}. ".yellow + "#{item}".cyan
        end
        puts "[+] Choisissez le numéro de l'article à retirer :".green
        item_choice = gets.chomp.to_i
        if item_choice > 0 && item_choice <= selected_list.items.length
          selected_list.items.delete_at(item_choice - 1)
          puts "[!] Article supprimé avec succès !".green
        else
          puts "[!] Numéro d'article !nV@lid€".red
        end
      when 3
        if selected_list.items.empty?
          puts "[!] Aucun article dans cette liste".red
        else
          puts "[+] Voici vos articles :".green
          selected_list.items.each_with_index do |item, index|
            puts "#{index + 1}. ".yellow + "#{item}".cyan
          end
        end
      when 4
        puts "<-- Retour au menu principal".blue
        break
      else
        puts "[!] Choix !nV@lid€ !".red
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
        puts "[+] Veuillez donnez un nom à cette liste".green
        list_name = gets.chomp

        if list_name.strip.empty?
          puts "[!] Le nom de la liste ne peut pas être vide !".red
        elsif list_exists?(list_name)
          puts "[!] Cette liste existe déjà !".red
        else
          new_list = ShoppingList.new(list_name)
          @lists << new_list
          puts "[!] Votre liste à bien été enregistré !".green
        end
      when 2
        display_lists
      when 3
        select_list
      when 4
        puts "À bientôt".blue
        break
      else
        puts "Je ne suis pas sur de CoπPr&nDr€".red
      end
    end
  end
end

# Création et lancement de l'application
manager = ShoppingListManager.new
manager.start
