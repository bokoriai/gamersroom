const { environment } = require('@rails/webpacker')

const webpack = require('webpack')
environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        jQuery: 'jquery/src/hquery',
        Popper: 'popper.js'
    })
)

module.exports = environment
