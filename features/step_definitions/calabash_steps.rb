require 'calabash-android/calabash_steps'
require_relative '../objects/basic.rb'

Dado(/^que estou na tela do TrianguloApp$/) do
 	element_exists("* text:'TrianguloApp'")
	element_exists("* id:'layout_componentes'")
end

Quando(/^eu preencher os campos com o mesmo valor$/) do 
	basic = Basic.new
	basic.fill_text_field('3', 'txtLado1')
	basic.fill_text_field('3', 'txtLado2')
	basic.fill_text_field('3', 'txtLado3')
end

Quando(/^eu clicar em Calcular$/) do
   Basic.new.touch_element('btnCalcular')
end

Entao(/^a mensagem "([^"]*)" sera exibida$/) do |msg1|
   expect(element_exists("* text:'#{msg1}'")).to eq(true)
end