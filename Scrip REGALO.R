library(shiny)

ui <- fluidPage(
  
  tags$head(
    
    tags$meta(
      name = "viewport",
      content = "width=device-width, initial-scale=1"
    ),
    
    tags$style(HTML("

      body {
        background: #101522;
        color: white;
        font-family: Arial, sans-serif;
        text-align: center;
        overflow-x: hidden;
      }

      .contenedor {
        max-width: 750px;
        margin: 35px auto;
        padding: 25px;
      }

      h1 {
        color: #ffb900;
        font-weight: bold;
        font-size: 35px;
      }

      .subtitulo {
        color: #dddddd;
        font-size: 18px;
      }

      .regalo {
        font-size: 110px;
        margin: 35px 0;
        animation: flotar 2s infinite;
      }

      @keyframes flotar {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-15px); }
      }

      .boton {
        background: #e32636;
        color: white;
        border: none;
        border-radius: 30px;
        padding: 15px 30px;
        font-size: 19px;
        cursor: pointer;
        margin: 15px;
      }

      .boton:hover {
        background: #ff4858;
      }

      /* PISTA */

      #escena {
        display: none;
      }

      .pista {
        position: relative;
        background: #343434;
        height: 180px;
        border-top: 9px solid #ff8500;
        border-bottom: 9px solid #ff8500;
        margin-top: 60px;
        overflow: hidden;
        border-radius: 8px;
      }

      .linea {
        position: absolute;
        top: 50%;
        width: 100%;
        border-top: 5px dashed white;
      }

      .meta {
        position: absolute;
        right: 25px;
        top: 0;
        height: 100%;
        width: 25px;
        background: repeating-conic-gradient(
          white 0% 25%,
          black 0% 50%
        ) 0 0 / 24px 24px;
      }

      .carrito {
        position: absolute;
        left: 0;
        top: 45px;
        font-size: 65px;
        z-index: 2;
        transform: scaleX(-1);
      }

      .correr {
        animation: carrera 8s linear forwards;
      }

      @keyframes carrera {
        0% {
          left: 0%;
        }

        100% {
          left: calc(100% - 105px);
        }
      }

      /* MENSAJE FINAL */

      #final {
        display: none;
        margin-top: 35px;
        animation: aparecer 3s ease;
      }

      @keyframes aparecer {
        from {
          opacity: 0;
          transform: translateY(30px);
        }

        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      .corazon {
        font-size: 75px;
        animation: latido 1s infinite;
      }

      @keyframes latido {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.15); }
      }

      .dedicatoria {
        background: #20283b;
        border: 2px solid #ffb900;
        border-radius: 20px;
        padding: 30px;
        margin-top: 25px;
        font-size: 20px;
        line-height: 1.8;
      }

      .firma {
        color: #ffb900;
        font-style: italic;
        font-size: 23px;
      }

      #reiniciar {
        display: none;
      }

    ")),
    
    tags$script(HTML("

      document.addEventListener('DOMContentLoaded', function() {

        const boton = document.getElementById('abrir');
        const inicio = document.getElementById('inicio');
        const escena = document.getElementById('escena');
        const carrito = document.getElementById('carrito');
        const final = document.getElementById('final');
        const reiniciar = document.getElementById('reiniciar');

        let temporizador;

        boton.addEventListener('click', function() {

          inicio.style.display = 'none';
          escena.style.display = 'block';
          final.style.display = 'none';
          reiniciar.style.display = 'none';

          carrito.classList.remove('correr');
          void carrito.offsetWidth;
          carrito.classList.add('correr');

          temporizador = setTimeout(function() {

            final.style.display = 'block';
            reiniciar.style.display = 'inline-block';

          }, 8000);

        });

        reiniciar.addEventListener('click', function() {

          clearTimeout(temporizador);

          inicio.style.display = 'block';
          escena.style.display = 'none';
          final.style.display = 'none';
          reiniciar.style.display = 'none';

          carrito.classList.remove('correr');

        });

      });

    "))
  ),
  
  div(
    class = "contenedor",
    
    h1("HOT WHEELS"),
    
    div(
      class = "subtitulo",
      "30 DE SEPTIEMBRE"
    ),
    
    # PANTALLA INICIAL
    
    div(
      id = "inicio",
      
      div(
        class = "regalo",
        "🎁"
      ),
      
      h2("Tengo una sorpresa para ti Gabriel"),
      
      p("Espero minimo te agrade jsjsjs"),
      
      p("lo se soy increible (es sarcasmo) :)"),
      
      tags$button(
        id = "abrir",
        class = "boton",
        "ABRIR REGALO"
      )
    ),
    
    # ESCENA DE CARRERA
    
    div(
      id = "escena",
      
      h2("Esto no va a la casa de Damián..."),
      
      p("tiene otro destino..."),
      
      div(
        class = "pista",
        
        div(class = "linea"),
        
        div(class = "meta"),
        
        div(
          id = "carrito",
          class = "carrito",
          "🏎️"
        )
      ),
      
      h3("🏁 ¡Y el último en quedar que apague la luz.. LA LA LA!")
    ),
    
    # DEDICATORIA
    
    div(
      id = "final",
      
      div(
        class = "corazon",
        "🐎"
      ),
      
      h1("¡FELIZ 30 DE SEPTIEMBRE!"),
      
      div(
        class = "dedicatoria",
        
        p("SESUPONE que hoy se regalan Hot Wheels..."),
        
        p(
          strong(
            "pero yo decidí hacerte uno a mi manera, obvio 💅🏻."
          )
        ),
        
        p(
          "lo malo de ser buena en R es que me creo capaz de hacer todo,",
          tags$br(),
          "continuando... podria haberte regalo unos Hot Wheels 
          pero eso es lo normal y sabemos que somos raros xd"
        ),
        
        p(
          "Y si te parece que... me tarde mucho pues si!.",
          tags$br(),
          "Me divertí mucho programándolo :) (mentira, me queria rendir jsjsj)"
        ),
        
        tags$hr(),
        
        div(
          class = "firma",
          "Con cariño, Yasmin ♥"
        )
      )
    ),
    
    tags$button(
      id = "reiniciar",
      class = "boton",
      "VOLVER A VER EL REGALO"
    )
  )
)

server <- function(input, output, session) {
  
}

shinyApp(ui = ui, server = server)

