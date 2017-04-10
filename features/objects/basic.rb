require 'calabash-android/operations'

class Basic

include Calabash::Android::Operations

	def fill_text_field(text, element, time_out=10, query = nil)
		query = "* marked:'#{element}'" if query.nil?
		tap_when_element_exists(query, timeout: time_out)
		keyboard_enter_text(text)
		hide_soft_keyboard
	rescue => e
		raise "Campo de texto #{element} não encontrado na tela.\nErro: #{e.message}"
	end

	def touch_element(element, time_out=10, query = nil)
		query = "* marked:'#{element}'" if query.nil?
		wait_for(timeout: time_out) { element_exists(query) }
		touch query
		hide_soft_keyboard
	rescue => e
		raise "Problema ao encontrar elemento: #{element} na tela.\nErro: #{e.message}"
	end
	
end