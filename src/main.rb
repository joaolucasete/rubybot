# frozen_string_literal: true

require 'discordrb'
require 'yaml'

CONFIG = YAML.load_file('./config.yaml')
Bot = Discordrb::Commands::CommandBot.new(
  token: CONFIG['token'],
  client_id: CONFIG['client_id'],
  prefix: ["<@#{CONFIG['client_id']}> ", '.'],
  ignore_bots: true,
  spaces_allowed: true,
  compress_mode: :stream
)

require_relative 'lib/index'
