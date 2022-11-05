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
  },
  daisyui: {
    themes: [
      {
        stefin: {
          "base-100": "#ffffff",
          "base-200": "#f0eee2",
          "base-300": "#d9d0bb",
          "base-content": "#000000",

          "neutral": "#ffffff",
          "neutral-content": "#000000",

          "primary": "#000000",
          "primary-focus": "#191919",
          "primary-content": "#ffffff",

          "accent": "#ff5c95",
          "accent-focus": "#e55286",
          "accent-content": "#000000",

          "secondary": "#00c4ff",

          "info": "#00c4ff",
          "info-content": "#000000",

          "success": "#009900",
          "success-content": "#ffffff",

          "warning": "#ffc700",
          "warning-content": "#000000",

          "error": "#ff0000",
          "error-content": "#ffffff",

          "--btn-text-case": "lowercase",

          "--rounded-box": "0.5rem",
          "--rounded-btn": "0.25rem"
        }
      }
    ]
  }
}
