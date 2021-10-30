const { environment } = require('@rails/webpacker')

// for dropdown
const webpack = require('webpack') 
environment.plugins.prepend('Provide',
    new webpack.ProvidePlugin({ 
        $: 'jquery/src/jquery', 
        jQuery: 'jquery/src/jquery'
    }) 
)

module.exports = environment
