# coding: utf-8

require 'htmlentities'

entities = HTMLEntities.new

#input = "Sortir et faire la f&#234;te jusqu'&#224; l'aube!"
#input = "\352\260\200\353\202\230\353\213\244".force_encoding('utf-8')
#input = "äöü"
input = "Test couleur : test de personnalit&#233;\xE2\x80\xA6".force_encoding('utf-8')

puts entities.decode(input)
