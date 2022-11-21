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
  daisyui: {
    themes: [
      {
        light: {
          ...require("daisyui/src/colors/themes")["[data-theme=light]"],
          "base-100": "#ffffff",
          "base-200": "#f8f8f9",
          "base-300": "#515a6e",
          "base-content": "#17233d",

          "primary": "#2d8cf0",
          "primary-focus": "#5cadff",

          "success": "#19be6b",
          "info": "#2db7f5",
          "warning": "#ff9900",
          "error": "#ed4014",
          "error-content": "#ffffff",

          "--rounded-btn": "0.25rem",
          "--rounded-box": "0.50rem",

          "--btn-text-case": "none"
        }
      }
    ]
  },
  theme: {
    fontFamily: {
      sans: ['Fira Sans', 'sans-serif']
    },
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
}
