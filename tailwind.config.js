module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Graphik', 'sans-serif'],
        serif: ['Merriweather', 'serif'],
      }
    },
    container: {
      center: true,
    },
    aspectRatio: {
      1: '1',
      2: '2',
      3: '3',
      4: '4',
    }
  },
  corePlugins: {
    aspectRatio: false,
  },
  plugins: [
    require('preline/plugin'),
    require('@tailwindcss/aspect-ratio')
    
  ]
}
