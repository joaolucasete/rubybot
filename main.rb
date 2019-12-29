# frozen_string_literal: true

require 'yaml'
require 'discordrb'

CONFIG = YAML.load_file('./config.yaml')
Bot = Discordrb::Commands::CommandBot.new(
  token: CONFIG['token'],
  client_id: CONFIG['client_id'],
  prefix: ["<@#{CONFIG['client_id']}> ", '.'],
  ignore_bots: true,
  spaces_allowed: true,
  compress_mode: :stream
)

LOGGER = Discordrb::Logger.new
LOGGER.mode = :normal
require_relative 'src/index'
