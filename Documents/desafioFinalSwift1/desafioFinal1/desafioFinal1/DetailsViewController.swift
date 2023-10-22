//
//  DetailsViewController.swift
//  desafioFinal1
//
//  Created by Gustavo Matoso on 15/10/23.
//

import UIKit

class DetailsViewController: UIViewController {

    
    var pageTitle: String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.cyan
        
        var explicacao: String

        switch pageTitle! {
        case "Java 8":
            explicacao = """
            Java 8 é uma versão da linguagem de programação Java que introduziu recursos importantes, como expressões lambda e streams. Essas adições tornaram o código Java mais conciso e eficiente. É amplamente utilizado no desenvolvimento de aplicativos empresariais, sistemas de gerenciamento e muito mais. A programação em Java 8 envolve a criação de classes, métodos e o uso de estruturas de controle para criar lógica de software.
            """
        case "Python 3":
            explicacao = """
            Python 3 é uma linguagem de programação de alto nível conhecida por sua simplicidade e legibilidade. É amplamente utilizado em diversos campos, desde desenvolvimento web até ciência de dados e aprendizado de máquina. A linguagem Python 3 é caracterizada por sua sintaxe clara e expressiva, tornando-a adequada para programadores iniciantes e experientes. Os desenvolvedores usam Python 3 para criar aplicativos, scripts e análise de dados, aproveitando sua ampla biblioteca padrão e pacotes de terceiros.
            """
        case "Javascript":
            explicacao = """
            Javascript é uma linguagem de programação usada para adicionar interatividade a páginas da web. É uma das principais tecnologias por trás do desenvolvimento web front-end e é amplamente suportado por navegadores. Desenvolvedores usam Javascript para criar recursos dinâmicos, como formulários interativos, animações e manipulação de DOM (Document Object Model). A linguagem é essencial para a criação de experiências web interativas e ricas em conteúdo.
            """
        case "UI/UX":
            explicacao = """
            UI (User Interface) e UX (User Experience) referem-se ao design de interfaces de usuário e à experiência do usuário, respectivamente. UI é responsável pela aparência e disposição dos elementos em uma tela, enquanto o UX se concentra em tornar a interação do usuário o mais suave e agradável possível. Ambos desempenham um papel fundamental no design de aplicativos e sites, garantindo que os usuários tenham uma experiência satisfatória. Os profissionais de UI/UX colaboram para criar designs eficazes que atendam às necessidades dos usuários.
            """
        case "Kotlin":
            explicacao = """
            Kotlin é uma linguagem de programação moderna que se tornou popular no desenvolvimento Android. Ela é conhecida por sua concisão e segurança, permitindo que os desenvolvedores escrevam código mais claro e menos sujeito a erros. Kotlin é 100% interoperável com o Java, o que facilita a migração de aplicativos existentes. Os desenvolvedores usam Kotlin para criar aplicativos Android de alto desempenho, que oferecem uma experiência de usuário superior.
            """
        case "Swift":
            explicacao = """
            Swift é a linguagem de programação oficial da Apple, projetada para desenvolver aplicativos iOS, macOS, watchOS e tvOS. Ela é conhecida por sua segurança, desempenho e facilidade de uso. Swift tornou-se a escolha preferida para desenvolvedores Apple devido à sua sintaxe amigável e recursos modernos, como Optionals e Type Inference. Os desenvolvedores Swift podem criar aplicativos que funcionam perfeitamente nos dispositivos Apple, proporcionando uma experiência de usuário excepcional.
            """
        case "Html e CSS":
            explicacao = """
            HTML (Hypertext Markup Language) e CSS (Cascading Style Sheets) são as bases da web. HTML é usado para estruturar o conteúdo de uma página da web, definindo cabeçalhos, parágrafos, imagens e links. CSS, por outro lado, é responsável pelo design e estilo da página, controlando cores, fontes, layout e muito mais. Juntos, HTML e CSS permitem a criação de páginas da web atrativas e funcionais que podem ser exibidas em navegadores.
            """
        case "Flutter":
            explicacao = """
            Flutter é um framework de desenvolvimento de aplicativos móveis multiplataforma desenvolvido pela Google. Ele usa a linguagem Dart e permite que os desenvolvedores criem aplicativos para Android e iOS a partir de um único código-fonte. Flutter é conhecido por sua facilidade de uso e pela capacidade de criar interfaces de usuário elegantes e personalizadas. Ele fornece widgets personalizáveis e recursos de alto desempenho que facilitam a criação de aplicativos bonitos e responsivos.
            """
        case "Git e Github":
            explicacao = """
            Git é um sistema de controle de versão usado para rastrear e gerenciar as alterações no código-fonte de projetos de software. Ele permite que os desenvolvedores colaborem, trabalhem em diferentes ramos e acompanhem as revisões. O Github é uma plataforma de hospedagem de código que facilita o compartilhamento, a colaboração e a documentação de projetos. Ela oferece recursos como rastreamento de problemas, controle de versão e integração contínua. Juntos, Git e Github são essenciais para o desenvolvimento de software em equipe e de código aberto.
            """
        default:
            explicacao = "Esse Bootcamp ainda não está disponivel! Aguarde Dev!"
        }
        
        let label = UILabel()
           
            label.numberOfLines = 0
            label.lineBreakMode = .byWordWrapping
            label.text = explicacao
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                                     label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                                      label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
                                      label.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
                                  ])
    }
}
    

   
