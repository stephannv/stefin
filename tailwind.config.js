module.exports = {
  content: [
    './app/assets/stylesheets/**/*.css',
    './app/helpers/**/*.rb',
    './app/lib/ds/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.html.erb',
    './app/views/**/*.rb'
  ],
  plugins: [require("daisyui")],
  theme: {
    extend: {
      keyframes: {
        "fade-in-up": {
          "0%": {
            opacity: "0",
            transform: "translateY(20px)"
          },
          "10%": {
            opacity: "1",
            transform: "translateY(0)"
          },
          "90%": {
            opacity: "1",
            transform: "translateY(0)"
          },
          "100%": {
            opacity: "0",
            transform: "translateY(-20px)"
          }
        }
      },
      animation: {
        "fade-in-up": "fade-in-up 4s ease-in-out forwards"
      }
    }
  }
}
