# Export Plugin
module.exports = (BasePlugin) ->
	# Define Plugin
	class EscapePlugin extends BasePlugin
		# Plugin name
		name: 'escape'

		# Set a high priority so it runs after the partials plugin
		renderDocumentPriority: 600

		# RenderDocument
		# Called per document, for each extension conversion. Used to render one extension to another.
		renderDocument: (opts, next) ->
			_s = require('underscore.string');
			opts.content = opts.content.replace ///<escape>(\r|\r\n|\n|.)+</escape>///g, (a,b) ->
				result = a.replace(///</?escape>///g, '')
				return _s.trim(_s.escapeHTML(result))
			return next()
