CREATE DATABASE IF NOT EXISTS diet_control;

USE diet_control;

CREATE TABLE
    IF NOT EXISTS users (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        password VARCHAR (100) NOT NULL,
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        isPremium BOOLEAN NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS usersBasic (
        id INT PRIMARY KEY AUTO_INCREMENT,
        user_id INT,
        FOREIGN KEY (user_id) REFERENCES users(id),
        height FLOAT NOT NULL,
        weight FLOAT NOT NULL,
        age INT NOT NULL,
        gender VARCHAR(15)
    );

CREATE TABLE
    IF NOT EXISTS `food_generics` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `grupo` varchar(248) DEFAULT NULL,
        `descricao` text DEFAULT NULL,
        `kcal` double DEFAULT NULL,
        `proteina` double DEFAULT NULL,
        `carboidratos` double DEFAULT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 598 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `food_generics`
VALUES (
        1,
        'Cereais e derivados',
        'Arroz, integral, cozido',
        123.53,
        2.59,
        25.81
    ), (
        2,
        'Cereais e derivados',
        'Arroz, integral, cru',
        359.68,
        7.32,
        77.45
    ), (
        3,
        'Cereais e derivados',
        'Arroz, tipo 1, cozido',
        128.26,
        2.52,
        28.06
    ), (
        4,
        'Cereais e derivados',
        'Arroz, tipo 1, cru',
        357.79,
        7.16,
        78.76
    ), (
        5,
        'Cereais e derivados',
        'Arroz, tipo 2, cozido',
        130.12,
        2.57,
        28.19
    ), (
        6,
        'Cereais e derivados',
        'Arroz, tipo 2, cru',
        358.12,
        7.24,
        78.88
    ), (
        7,
        'Cereais e derivados',
        'Aveia, flocos, crua',
        393.82,
        13.92,
        66.64
    ), (
        8,
        'Cereais e derivados',
        'Biscoito, doce, maisena',
        442.82,
        8.07,
        75.23
    ), (
        9,
        'Cereais e derivados',
        'Biscoito, doce, recheado com chocolate',
        471.82,
        6.4,
        70.55
    ), (
        10,
        'Cereais e derivados',
        'Biscoito, doce, recheado com morango',
        471.17,
        5.72,
        71.01
    ), (
        11,
        'Cereais e derivados',
        'Biscoito, doce, wafer, recheado de chocolate',
        502.46,
        5.56,
        67.54
    ), (
        12,
        'Cereais e derivados',
        'Biscoito, doce, wafer, recheado de morango',
        513.45,
        4.52,
        67.35
    ), (
        13,
        'Cereais e derivados',
        'Biscoito, salgado, cream cracker',
        431.73,
        10.06,
        68.73
    ), (
        14,
        'Cereais e derivados',
        'Bolo, mistura para',
        418.63,
        6.16,
        84.71
    ), (
        15,
        'Cereais e derivados',
        'Bolo, pronto, aipim',
        323.85,
        4.42,
        47.86
    ), (
        16,
        'Cereais e derivados',
        'Bolo, pronto, chocolate',
        410.01,
        6.22,
        54.72
    ), (
        17,
        'Cereais e derivados',
        'Bolo, pronto, coco',
        333.44,
        5.67,
        52.28
    ), (
        18,
        'Cereais e derivados',
        'Bolo, pronto, milho',
        311.39,
        4.8,
        45.11
    ), (
        19,
        'Cereais e derivados',
        'Canjica, branca, crua',
        357.6,
        7.2,
        78.06
    ), (
        20,
        'Cereais e derivados',
        'Canjica, com leite integral',
        112.46,
        2.36,
        23.63
    ), (
        21,
        'Cereais e derivados',
        'Cereais, milho, flocos, com sal',
        369.6,
        7.29,
        80.83
    ), (
        22,
        'Cereais e derivados',
        'Cereais, milho, flocos, sem sal',
        363.34,
        6.88,
        80.45
    ), (
        23,
        'Cereais e derivados',
        'Cereais, mingau, milho, infantil',
        394.43,
        6.43,
        87.27
    ), (
        24,
        'Cereais e derivados',
        'Cereais, mistura para vitamina, trigo, cevada e aveia',
        381.13,
        8.9,
        81.62
    ), (
        25,
        'Cereais e derivados',
        'Cereal matinal, milho',
        365.35,
        7.16,
        83.82
    ), (
        26,
        'Cereais e derivados',
        'Cereal matinal, milho, açúcar',
        376.56,
        4.74,
        88.84
    ), (
        27,
        'Cereais e derivados',
        'Creme de arroz, pó',
        386,
        7.03,
        83.87
    ), (
        28,
        'Cereais e derivados',
        'Creme de milho, pó',
        333.03,
        4.82,
        86.15
    ), (
        29,
        'Cereais e derivados',
        'Curau, milho verde',
        78.43,
        2.36,
        13.94
    ), (
        30,
        'Cereais e derivados',
        'Curau, milho verde, mistura para',
        402.29,
        2.22,
        79.82
    ), (
        31,
        'Cereais e derivados',
        'Farinha, de arroz, enriquecida',
        363.06,
        1.27,
        85.5
    ), (
        32,
        'Cereais e derivados',
        'Farinha, de centeio, integral',
        335.78,
        12.52,
        73.3
    ), (
        33,
        'Cereais e derivados',
        'Farinha, de milho, amarela',
        350.59,
        7.19,
        79.08
    ), (
        34,
        'Cereais e derivados',
        'Farinha, de rosca',
        370.58,
        11.38,
        75.79
    ), (
        35,
        'Cereais e derivados',
        'Farinha, de trigo',
        360.47,
        9.79,
        75.09
    ), (
        36,
        'Cereais e derivados',
        'Farinha, láctea, de cereais',
        414.85,
        11.88,
        77.77
    ), (
        37,
        'Cereais e derivados',
        'Lasanha, massa fresca, cozida',
        163.76,
        5.81,
        32.52
    ), (
        38,
        'Cereais e derivados',
        'Lasanha, massa fresca, crua',
        220.31,
        7.01,
        45.06
    ), (
        39,
        'Cereais e derivados',
        'Macarrão, instantâneo',
        435.86,
        8.79,
        62.43
    ), (
        40,
        'Cereais e derivados',
        'Macarrão, trigo, cru',
        371.12,
        10,
        77.94
    ), (
        41,
        'Cereais e derivados',
        'Macarrão, trigo, cru, com ovos',
        370.57,
        10.32,
        76.62
    ), (
        42,
        'Cereais e derivados',
        'Milho, amido, cru',
        361.37,
        0.6,
        87.15
    ), (
        43,
        'Cereais e derivados',
        'Milho, fubá, cru',
        353.48,
        7.21,
        78.87
    ), (
        44,
        'Cereais e derivados',
        'Milho, verde, cru',
        138.17,
        6.59,
        28.56
    ), (
        45,
        'Cereais e derivados',
        'Milho, verde, enlatado, drenado',
        97.56,
        3.23,
        17.14
    ), (
        46,
        'Cereais e derivados',
        'Mingau tradicional, pó',
        373.42,
        0.58,
        89.34
    ), (
        47,
        'Cereais e derivados',
        'Pamonha, barra para cozimento, pré-cozida',
        171.22,
        2.55,
        30.68
    ), (
        48,
        'Cereais e derivados',
        'Pão, aveia, forma',
        343.09,
        12.35,
        59.57
    ), (
        49,
        'Cereais e derivados',
        'Pão, de soja',
        308.73,
        11.34,
        56.51
    ), (
        50,
        'Cereais e derivados',
        'Pão, glúten, forma',
        252.99,
        11.95,
        44.12
    ), (
        51,
        'Cereais e derivados',
        'Pão, milho, forma',
        292.01,
        8.3,
        56.4
    ), (
        52,
        'Cereais e derivados',
        'Pão, trigo, forma, integral',
        253.19,
        9.43,
        49.94
    ), (
        53,
        'Cereais e derivados',
        'Pão, trigo, francês',
        299.81,
        7.95,
        58.65
    ), (
        54,
        'Cereais e derivados',
        'Pão, trigo, sovado',
        310.96,
        8.4,
        61.45
    ), (
        55,
        'Cereais e derivados',
        'Pastel, de carne, cru',
        288.7,
        10.74,
        42.02
    ), (
        56,
        'Cereais e derivados',
        'Pastel, de carne, frito',
        388.37,
        10.1,
        43.77
    ), (
        57,
        'Cereais e derivados',
        'Pastel, de queijo, cru',
        308.47,
        9.85,
        45.95
    ), (
        58,
        'Cereais e derivados',
        'Pastel, de queijo, frito',
        422.11,
        8.71,
        48.13
    ), (
        59,
        'Cereais e derivados',
        'Pastel, massa, crua',
        310.2,
        6.9,
        57.38
    ), (
        60,
        'Cereais e derivados',
        'Pastel, massa, frita',
        569.67,
        6.02,
        49.34
    ), (
        61,
        'Cereais e derivados',
        'Pipoca, com óleo de soja, sem sal',
        448.33,
        9.93,
        70.31
    ), (
        62,
        'Cereais e derivados',
        'Polenta, pré-cozida',
        102.74,
        2.29,
        23.31
    ), (
        63,
        'Cereais e derivados',
        'Torrada, pão francês',
        377.42,
        10.52,
        74.56
    ), (
        64,
        'Verduras, hortaliças e derivados',
        'Abóbora, cabotian, cozida',
        48.04,
        1.44,
        10.76
    ), (
        65,
        'Verduras, hortaliças e derivados',
        'Abóbora, cabotian, crua',
        38.6,
        1.75,
        8.36
    ), (
        66,
        'Verduras, hortaliças e derivados',
        'Abóbora, menina brasileira, crua',
        13.61,
        0.61,
        3.3
    ), (
        67,
        'Verduras, hortaliças e derivados',
        'Abóbora, moranga, crua',
        12.36,
        0.96,
        2.67
    ), (
        68,
        'Verduras, hortaliças e derivados',
        'Abóbora, moranga, refogada',
        29,
        0.39,
        5.98
    ), (
        69,
        'Verduras, hortaliças e derivados',
        'Abóbora, pescoço, crua',
        24.47,
        0.67,
        6.12
    ), (
        70,
        'Verduras, hortaliças e derivados',
        'Abobrinha, italiana, cozida',
        15.04,
        1.13,
        2.98
    ), (
        71,
        'Verduras, hortaliças e derivados',
        'Abobrinha, italiana, crua',
        19.28,
        1.14,
        4.29
    ), (
        72,
        'Verduras, hortaliças e derivados',
        'Abobrinha, italiana, refogada',
        24.43,
        1.07,
        4.19
    ), (
        73,
        'Verduras, hortaliças e derivados',
        'Abobrinha, paulista, crua',
        30.81,
        0.64,
        7.87
    ), (
        74,
        'Verduras, hortaliças e derivados',
        'Acelga, crua',
        20.94,
        1.44,
        4.63
    ), (
        75,
        'Verduras, hortaliças e derivados',
        'Agrião, cru',
        16.58,
        2.69,
        2.25
    ), (
        76,
        'Verduras, hortaliças e derivados',
        'Aipo, cru',
        19.09,
        0.76,
        4.27
    ), (
        77,
        'Verduras, hortaliças e derivados',
        'Alface, americana, crua',
        8.79,
        0.61,
        1.75
    ), (
        78,
        'Verduras, hortaliças e derivados',
        'Alface, crespa, crua',
        10.68,
        1.35,
        1.7
    ), (
        79,
        'Verduras, hortaliças e derivados',
        'Alface, lisa, crua',
        13.82,
        1.69,
        2.43
    ), (
        80,
        'Verduras, hortaliças e derivados',
        'Alface, roxa, crua',
        12.72,
        0.91,
        2.49
    ), (
        81,
        'Verduras, hortaliças e derivados',
        'Alfavaca, crua',
        29.18,
        2.66,
        5.24
    ), (
        82,
        'Verduras, hortaliças e derivados',
        'Alho, cru',
        113.13,
        7.01,
        23.91
    ), (
        83,
        'Verduras, hortaliças e derivados',
        'Alho-poró, cru',
        31.51,
        1.41,
        6.88
    ), (
        84,
        'Verduras, hortaliças e derivados',
        'Almeirão, cru',
        18.03,
        1.77,
        3.34
    ), (
        85,
        'Verduras, hortaliças e derivados',
        'Almeirão, refogado',
        65.08,
        1.7,
        5.7
    ), (
        86,
        'Verduras, hortaliças e derivados',
        'Batata, baroa, cozida',
        80.12,
        0.85,
        18.95
    ), (
        87,
        'Verduras, hortaliças e derivados',
        'Batata, baroa, crua',
        100.98,
        1.05,
        23.98
    ), (
        88,
        'Verduras, hortaliças e derivados',
        'Batata, doce, cozida',
        76.76,
        0.64,
        18.42
    ), (
        89,
        'Verduras, hortaliças e derivados',
        'Batata, doce, crua',
        118.24,
        1.26,
        28.2
    ), (
        90,
        'Verduras, hortaliças e derivados',
        'Batata, frita, tipo chips, industrializada',
        542.73,
        5.58,
        51.22
    ), (
        91,
        'Verduras, hortaliças e derivados',
        'Batata, inglesa, cozida',
        51.59,
        1.16,
        11.94
    ), (
        92,
        'Verduras, hortaliças e derivados',
        'Batata, inglesa, crua',
        64.37,
        1.77,
        14.69
    ), (
        93,
        'Verduras, hortaliças e derivados',
        'Batata, inglesa, frita',
        267.16,
        4.97,
        35.64
    ), (
        94,
        'Verduras, hortaliças e derivados',
        'Batata, inglesa, sauté',
        67.89,
        1.29,
        14.09
    ), (
        95,
        'Verduras, hortaliças e derivados',
        'Berinjela, cozida',
        18.85,
        0.68,
        4.47
    ), (
        96,
        'Verduras, hortaliças e derivados',
        'Berinjela, crua',
        19.63,
        1.22,
        4.43
    ), (
        97,
        'Verduras, hortaliças e derivados',
        'Beterraba, cozida',
        32.15,
        1.29,
        7.23
    ), (
        98,
        'Verduras, hortaliças e derivados',
        'Beterraba, crua',
        48.83,
        1.95,
        11.11
    ), (
        99,
        'Verduras, hortaliças e derivados',
        'Biscoito, polvilho doce',
        437.55,
        1.29,
        80.54
    ), (
        100,
        'Verduras, hortaliças e derivados',
        'Brócolis, cozido',
        24.64,
        2.13,
        4.37
    ), (
        101,
        'Verduras, hortaliças e derivados',
        'Brócolis, cru',
        25.5,
        3.64,
        4.03
    ), (
        102,
        'Verduras, hortaliças e derivados',
        'Cará, cozido',
        77.58,
        1.53,
        18.85
    ), (
        103,
        'Verduras, hortaliças e derivados',
        'Cará, cru',
        95.63,
        2.28,
        22.95
    ), (
        104,
        'Verduras, hortaliças e derivados',
        'Caruru, cru',
        34.03,
        3.2,
        5.97
    ), (
        105,
        'Verduras, hortaliças e derivados',
        'Catalonha, crua',
        23.89,
        1.87,
        4.75
    ), (
        106,
        'Verduras, hortaliças e derivados',
        'Catalonha, refogada',
        63.45,
        1.95,
        4.81
    ), (
        107,
        'Verduras, hortaliças e derivados',
        'Cebola, crua',
        39.42,
        1.71,
        8.85
    ), (
        108,
        'Verduras, hortaliças e derivados',
        'Cebolinha, crua',
        19.52,
        1.87,
        3.37
    ), (
        109,
        'Verduras, hortaliças e derivados',
        'Cenoura, cozida',
        29.86,
        0.85,
        6.69
    ), (
        110,
        'Verduras, hortaliças e derivados',
        'Cenoura, crua',
        34.14,
        1.32,
        7.66
    ), (
        111,
        'Verduras, hortaliças e derivados',
        'Chicória, crua',
        13.84,
        1.14,
        2.85
    ), (
        112,
        'Verduras, hortaliças e derivados',
        'Chuchu, cozido',
        18.54,
        0.41,
        4.79
    ), (
        113,
        'Verduras, hortaliças e derivados',
        'Chuchu, cru',
        16.98,
        0.7,
        4.14
    ), (
        114,
        'Verduras, hortaliças e derivados',
        'Coentro, folhas desidratadas',
        309.07,
        20.88,
        47.95
    ), (
        115,
        'Verduras, hortaliças e derivados',
        'Couve, manteiga, crua',
        27.06,
        2.87,
        4.33
    ), (
        116,
        'Verduras, hortaliças e derivados',
        'Couve, manteiga, refogada ',
        90.34,
        1.67,
        8.71
    ), (
        117,
        'Verduras, hortaliças e derivados',
        'Couve-flor, crua',
        22.56,
        1.91,
        4.52
    ), (
        118,
        'Verduras, hortaliças e derivados',
        'Couve-flor, cozida',
        19.11,
        1.24,
        3.88
    ), (
        119,
        'Verduras, hortaliças e derivados',
        'Espinafre, Nova Zelândia, cru',
        16.1,
        2,
        2.57
    ), (
        120,
        'Verduras, hortaliças e derivados',
        'Espinafre, Nova Zelândia, refogado',
        67.25,
        2.72,
        4.24
    ), (
        121,
        'Verduras, hortaliças e derivados',
        'Farinha, de mandioca, crua',
        360.87,
        1.55,
        87.9
    ), (
        122,
        'Verduras, hortaliças e derivados',
        'Farinha, de mandioca, torrada',
        365.27,
        1.23,
        89.19
    ), (
        123,
        'Verduras, hortaliças e derivados',
        'Farinha, de puba',
        360.18,
        1.62,
        87.29
    ), (
        124,
        'Verduras, hortaliças e derivados',
        'Fécula, de mandioca',
        330.85,
        0.52,
        81.15
    ), (
        125,
        'Verduras, hortaliças e derivados',
        'Feijão, broto, cru',
        38.72,
        4.17,
        7.76
    ), (
        126,
        'Verduras, hortaliças e derivados',
        'Inhame, cru',
        96.7,
        2.05,
        23.23
    ), (
        127,
        'Verduras, hortaliças e derivados',
        'Jiló, cru',
        27.37,
        1.4,
        6.19
    ), (
        128,
        'Verduras, hortaliças e derivados',
        'Jurubeba, crua',
        125.81,
        4.41,
        23.06
    ), (
        129,
        'Verduras, hortaliças e derivados',
        'Mandioca, cozida',
        125.36,
        0.57,
        30.09
    ), (
        130,
        'Verduras, hortaliças e derivados',
        'Mandioca, crua',
        151.42,
        1.13,
        36.17
    ), (
        131,
        'Verduras, hortaliças e derivados',
        'Mandioca, farofa, temperada',
        405.69,
        2.06,
        80.3
    ), (
        132,
        'Verduras, hortaliças e derivados',
        'Mandioca, frita',
        300.06,
        1.38,
        50.25
    ), (
        133,
        'Verduras, hortaliças e derivados',
        'Manjericão, cru',
        21.15,
        1.99,
        3.64
    ), (
        134,
        'Verduras, hortaliças e derivados',
        'Maxixe, cru',
        13.75,
        1.39,
        2.73
    ), (
        135,
        'Verduras, hortaliças e derivados',
        'Mostarda, folha, crua',
        18.11,
        2.11,
        3.24
    ), (
        136,
        'Verduras, hortaliças e derivados',
        'Nhoque, batata, cozido',
        180.78,
        5.86,
        36.78
    ), (
        137,
        'Verduras, hortaliças e derivados',
        'Nabo, cru',
        18.19,
        1.2,
        4.15
    ), (
        138,
        'Verduras, hortaliças e derivados',
        'Palmito, juçara, em conserva',
        23.2,
        1.79,
        4.33
    ), (
        139,
        'Verduras, hortaliças e derivados',
        'Palmito, pupunha, em conserva',
        29.43,
        2.46,
        5.51
    ), (
        140,
        'Verduras, hortaliças e derivados',
        'Pão, de queijo, assado',
        363.08,
        5.12,
        34.24
    ), (
        141,
        'Verduras, hortaliças e derivados',
        'Pão, de queijo, cru',
        294.54,
        3.65,
        38.51
    ), (
        142,
        'Verduras, hortaliças e derivados',
        'Pepino, cru',
        9.53,
        0.87,
        2.04
    ), (
        143,
        'Verduras, hortaliças e derivados',
        'Pimentão, amarelo, cru',
        27.93,
        1.22,
        5.96
    ), (
        144,
        'Verduras, hortaliças e derivados',
        'Pimentão, verde, cru',
        21.29,
        1.05,
        4.89
    ), (
        145,
        'Verduras, hortaliças e derivados',
        'Pimentão, vermelho, cru',
        23.28,
        1.04,
        5.47
    ), (
        146,
        'Verduras, hortaliças e derivados',
        'Polvilho, doce',
        351.23,
        0.43,
        86.77
    ), (
        147,
        'Verduras, hortaliças e derivados',
        'Quiabo, cru',
        29.94,
        1.92,
        6.37
    ), (
        148,
        'Verduras, hortaliças e derivados',
        'Rabanete, cru',
        13.74,
        1.39,
        2.73
    ), (
        149,
        'Verduras, hortaliças e derivados',
        'Repolho, branco, cru',
        17.12,
        0.88,
        3.86
    ), (
        150,
        'Verduras, hortaliças e derivados',
        'Repolho, roxo, cru',
        30.91,
        1.91,
        7.2
    ), (
        151,
        'Verduras, hortaliças e derivados',
        'Repolho, roxo, refogado',
        41.77,
        1.8,
        7.56
    ), (
        152,
        'Verduras, hortaliças e derivados',
        'Rúcula, crua',
        13.13,
        1.77,
        2.22
    ), (
        153,
        'Verduras, hortaliças e derivados',
        'Salsa, crua',
        33.42,
        3.26,
        5.71
    ), (
        154,
        'Verduras, hortaliças e derivados',
        'Seleta de legumes, enlatada',
        56.53,
        3.42,
        12.67
    ), (
        155,
        'Verduras, hortaliças e derivados',
        'Serralha, crua',
        30.4,
        2.67,
        4.95
    ), (
        156,
        'Verduras, hortaliças e derivados',
        'Taioba, crua',
        34.21,
        2.9,
        5.43
    ), (
        157,
        'Verduras, hortaliças e derivados',
        'Tomate, com semente, cru',
        15.34,
        1.1,
        3.14
    ), (
        158,
        'Verduras, hortaliças e derivados',
        'Tomate, extrato',
        60.93,
        2.43,
        14.96
    ), (
        159,
        'Verduras, hortaliças e derivados',
        'Tomate, molho industrializado',
        38.45,
        1.38,
        7.71
    ), (
        160,
        'Verduras, hortaliças e derivados',
        'Tomate, purê',
        27.94,
        1.36,
        6.89
    ), (
        161,
        'Verduras, hortaliças e derivados',
        'Tomate, salada',
        20.55,
        0.81,
        5.12
    ), (
        162,
        'Verduras, hortaliças e derivados',
        'Vagem, crua',
        24.9,
        1.79,
        5.35
    ), (
        163,
        'Frutas e derivados',
        'Abacate, cru',
        96.15,
        1.24,
        6.03
    ), (
        164,
        'Frutas e derivados',
        'Abacaxi, cru',
        48.32,
        0.86,
        12.33
    ), (
        165,
        'Frutas e derivados',
        'Abacaxi, polpa, congelada',
        30.59,
        0.47,
        7.8
    ), (
        166,
        'Frutas e derivados',
        'Abiu, cru',
        62.42,
        0.83,
        14.93
    ), (
        167,
        'Frutas e derivados',
        'Açaí, polpa, com xarope de guaraná e glucose',
        110.3,
        0.72,
        21.46
    ), (
        168,
        'Frutas e derivados',
        'Açaí, polpa, congelada',
        58.05,
        0.8,
        6.21
    ), (
        169,
        'Frutas e derivados',
        'Acerola, crua',
        33.46,
        0.91,
        7.97
    ), (
        170,
        'Frutas e derivados',
        'Acerola, polpa, congelada',
        21.94,
        0.59,
        5.54
    ), (
        171,
        'Frutas e derivados',
        'Ameixa, calda, enlatada ',
        182.85,
        0.41,
        46.89
    ), (
        172,
        'Frutas e derivados',
        'Ameixa, crua',
        52.54,
        0.77,
        13.85
    ), (
        173,
        'Frutas e derivados',
        'Ameixa, em calda, enlatada, drenada ',
        177.36,
        1.02,
        47.66
    ), (
        174,
        'Frutas e derivados',
        'Atemóia, crua',
        96.97,
        0.97,
        25.33
    ), (
        175,
        'Frutas e derivados',
        'Banana, da terra, crua',
        128.02,
        1.43,
        33.67
    ), (
        176,
        'Frutas e derivados',
        'Banana, doce em barra',
        280.11,
        2.17,
        75.67
    ), (
        177,
        'Frutas e derivados',
        'Banana, figo, crua',
        105.08,
        1.13,
        27.8
    ), (
        178,
        'Frutas e derivados',
        'Banana, maçã, crua',
        86.81,
        1.75,
        22.34
    ), (
        179,
        'Frutas e derivados',
        'Banana, nanica, crua',
        91.53,
        1.4,
        23.85
    ), (
        180,
        'Frutas e derivados',
        'Banana, ouro, crua',
        112.37,
        1.48,
        29.34
    ), (
        181,
        'Frutas e derivados',
        'Banana, pacova, crua',
        77.91,
        1.23,
        20.31
    ), (
        182,
        'Frutas e derivados',
        'Banana, prata, crua',
        98.25,
        1.27,
        25.96
    ), (
        183,
        'Frutas e derivados',
        'Cacau, cru',
        74.29,
        0.95,
        19.41
    ), (
        184,
        'Frutas e derivados',
        'Cajá-Manga, cru',
        45.58,
        1.28,
        11.43
    ), (
        185,
        'Frutas e derivados',
        'Cajá, polpa, congelada',
        26.33,
        0.59,
        6.37
    ), (
        186,
        'Frutas e derivados',
        'Caju, cru',
        43.07,
        0.97,
        10.29
    ), (
        187,
        'Frutas e derivados',
        'Caju, polpa, congelada',
        36.57,
        0.48,
        9.35
    ), (
        188,
        'Frutas e derivados',
        'Caju, suco concentrado, envasado',
        45.11,
        0.4,
        10.73
    ), (
        189,
        'Frutas e derivados',
        'Caqui, chocolate, cru',
        71.35,
        0.36,
        19.33
    ), (
        190,
        'Frutas e derivados',
        'Carambola, crua',
        45.74,
        0.87,
        11.48
    ), (
        191,
        'Frutas e derivados',
        'Ciriguela, crua',
        75.59,
        1.4,
        18.86
    ), (
        192,
        'Frutas e derivados',
        'Cupuaçu, cru',
        49.42,
        1.16,
        10.43
    ), (
        193,
        'Frutas e derivados',
        'Cupuaçu, polpa, congelada',
        48.8,
        0.84,
        11.39
    ), (
        194,
        'Frutas e derivados',
        'Figo, cru',
        41.45,
        0.97,
        10.25
    ), (
        195,
        'Frutas e derivados',
        'Figo, enlatado, em calda',
        184.36,
        0.56,
        50.34
    ), (
        196,
        'Frutas e derivados',
        'Fruta-pão, crua',
        67.05,
        1.08,
        17.17
    ), (
        197,
        'Frutas e derivados',
        'Goiaba, branca, com casca, crua',
        51.74,
        0.9,
        12.4
    ), (
        198,
        'Frutas e derivados',
        'Goiaba, doce em pasta',
        268.96,
        0.58,
        74.12
    ), (
        199,
        'Frutas e derivados',
        'Goiaba, doce, cascão',
        285.59,
        0.41,
        78.7
    ), (
        200,
        'Frutas e derivados',
        'Goiaba, vermelha, com casca, crua',
        54.17,
        1.09,
        13.01
    ), (
        201,
        'Frutas e derivados',
        'Graviola, crua',
        61.62,
        0.85,
        15.84
    ), (
        202,
        'Frutas e derivados',
        'Graviola, polpa, congelada',
        38.27,
        0.57,
        9.78
    ), (
        203,
        'Frutas e derivados',
        'Jabuticaba, crua',
        58.05,
        0.61,
        15.26
    ), (
        204,
        'Frutas e derivados',
        'Jaca, crua',
        87.92,
        1.4,
        22.5
    ), (
        205,
        'Frutas e derivados',
        'Jambo, cru',
        26.91,
        0.89,
        6.49
    ), (
        206,
        'Frutas e derivados',
        'Jamelão, cru',
        41.01,
        0.55,
        10.63
    ), (
        207,
        'Frutas e derivados',
        'Kiwi, cru',
        51.14,
        1.34,
        11.5
    ), (
        208,
        'Frutas e derivados',
        'Laranja, baía, crua',
        45.44,
        0.98,
        11.47
    ), (
        209,
        'Frutas e derivados',
        'Laranja, baía, suco',
        36.65,
        0.65,
        8.7
    ), (
        210,
        'Frutas e derivados',
        'Laranja, da terra, crua',
        51.47,
        1.08,
        12.86
    ), (
        211,
        'Frutas e derivados',
        'Laranja, da terra, suco',
        40.96,
        0.67,
        9.57
    ), (
        212,
        'Frutas e derivados',
        'Laranja, lima, crua',
        45.7,
        1.06,
        11.53
    ), (
        213,
        'Frutas e derivados',
        'Laranja, lima, suco',
        39.34,
        0.71,
        9.17
    ), (
        214,
        'Frutas e derivados',
        'Laranja, pêra, crua',
        36.77,
        1.04,
        8.95
    ), (
        215,
        'Frutas e derivados',
        'Laranja, pêra, suco',
        32.71,
        0.74,
        7.55
    ), (
        216,
        'Frutas e derivados',
        'Laranja, valência, crua',
        46.11,
        0.77,
        11.72
    ), (
        217,
        'Frutas e derivados',
        'Laranja, valência, suco',
        36.2,
        0.48,
        8.55
    ), (
        218,
        'Frutas e derivados',
        'Limão, cravo, suco',
        14.1,
        0.33,
        5.25
    ), (
        219,
        'Frutas e derivados',
        'Limão, galego, suco',
        22.23,
        0.57,
        7.32
    ), (
        220,
        'Frutas e derivados',
        'Limão, tahiti, cru',
        31.82,
        0.94,
        11.08
    ), (
        221,
        'Frutas e derivados',
        'Maçã, Argentina, com casca, crua',
        62.53,
        0.23,
        16.59
    ), (
        222,
        'Frutas e derivados',
        'Maçã, Fuji, com casca, crua',
        55.52,
        0.29,
        15.15
    ), (
        223,
        'Frutas e derivados',
        'Macaúba, crua',
        404.28,
        2.08,
        13.95
    ), (
        224,
        'Frutas e derivados',
        ' Mamão, doce em calda, drenado',
        195.63,
        0.19,
        54
    ), (
        225,
        'Frutas e derivados',
        'Mamão, Formosa, cru',
        45.34,
        0.82,
        11.55
    ), (
        226,
        'Frutas e derivados',
        'Mamão, Papaia, cru',
        40.16,
        0.46,
        10.44
    ), (
        227,
        'Frutas e derivados',
        ' Mamão verde, doce em calda, drenado',
        209.38,
        0.32,
        57.64
    ), (
        228,
        'Frutas e derivados',
        'Manga, Haden, crua',
        63.5,
        0.41,
        16.66
    ), (
        229,
        'Frutas e derivados',
        'Manga, Palmer, crua',
        72.49,
        0.41,
        19.35
    ), (
        230,
        'Frutas e derivados',
        'Manga, polpa, congelada',
        48.31,
        0.38,
        12.52
    ), (
        231,
        'Frutas e derivados',
        'Manga, Tommy Atkins, crua',
        50.69,
        0.86,
        12.77
    ), (
        232,
        'Frutas e derivados',
        'Maracujá, cru',
        68.44,
        1.99,
        12.26
    ), (
        233,
        'Frutas e derivados',
        'Maracujá, polpa, congelada',
        38.76,
        0.81,
        9.6
    ), (
        234,
        'Frutas e derivados',
        'Maracujá, suco concentrado, envasado',
        41.97,
        0.77,
        9.64
    ), (
        235,
        'Frutas e derivados',
        'Melancia, crua',
        32.61,
        0.88,
        8.14
    ), (
        236,
        'Frutas e derivados',
        'Melão, cru',
        29.37,
        0.68,
        7.53
    ), (
        237,
        'Frutas e derivados',
        'Mexerica, Murcote, crua',
        57.59,
        0.88,
        14.86
    ), (
        238,
        'Frutas e derivados',
        'Mexerica, Rio, crua',
        36.87,
        0.65,
        9.34
    ), (
        239,
        'Frutas e derivados',
        'Morango, cru',
        30.15,
        0.89,
        6.82
    ), (
        240,
        'Frutas e derivados',
        'Nêspera, crua',
        42.54,
        0.31,
        11.53
    ), (
        241,
        'Frutas e derivados',
        'Pequi, cru',
        204.97,
        2.34,
        12.97
    ), (
        242,
        'Frutas e derivados',
        'Pêra, Park, crua',
        60.59,
        0.24,
        16.07
    ), (
        243,
        'Frutas e derivados',
        'Pêra, Williams, crua',
        53.31,
        0.57,
        14.02
    ), (
        244,
        'Frutas e derivados',
        'Pêssego, Aurora, cru',
        36.33,
        0.82,
        9.32
    ), (
        245,
        'Frutas e derivados',
        'Pêssego, enlatado, em calda',
        63.14,
        0.71,
        16.88
    ), (
        246,
        'Frutas e derivados',
        'Pinha, crua',
        88.47,
        1.49,
        22.45
    ), (
        247,
        'Frutas e derivados',
        'Pitanga, crua',
        41.42,
        0.93,
        10.24
    ), (
        248,
        'Frutas e derivados',
        'Pitanga, polpa, congelada',
        19.11,
        0.29,
        4.76
    ), (
        249,
        'Frutas e derivados',
        'Romã, crua',
        55.74,
        0.4,
        15.11
    ), (
        250,
        'Frutas e derivados',
        'Tamarindo, cru',
        275.7,
        3.21,
        72.53
    ), (
        251,
        'Frutas e derivados',
        'Tangerina, Poncã, crua',
        37.83,
        0.85,
        9.61
    ), (
        252,
        'Frutas e derivados',
        'Tangerina, Poncã, suco',
        36.11,
        0.52,
        8.8
    ), (
        253,
        'Frutas e derivados',
        'Tucumã, cru',
        262.02,
        2.09,
        26.47
    ), (
        254,
        'Frutas e derivados',
        'Umbu, cru',
        37.02,
        0.84,
        9.4
    ), (
        255,
        'Frutas e derivados',
        'Umbu, polpa, congelada',
        33.94,
        0.51,
        8.79
    ), (
        256,
        'Frutas e derivados',
        'Uva, Itália, crua',
        52.87,
        0.75,
        13.57
    ), (
        257,
        'Frutas e derivados',
        'Uva, Rubi, crua',
        49.06,
        0.61,
        12.7
    ), (
        258,
        'Frutas e derivados',
        'Uva, suco concentrado, envasado',
        57.66,
        0,
        14.71
    ), (
        259,
        'Gorduras e óleos',
        'Azeite, de dendê',
        884,
        0,
        0
    ), (
        260,
        'Gorduras e óleos',
        'Azeite, de oliva, extra virgem',
        884,
        0,
        0
    ), (
        261,
        'Gorduras e óleos',
        'Manteiga, com sal',
        725.97,
        0.41,
        0.06
    ), (
        262,
        'Gorduras e óleos',
        'Manteiga, sem sal',
        757.54,
        0.4,
        0
    ), (
        263,
        'Gorduras e óleos',
        'Margarina, com óleo hidrogenado, com sal (65% de lipídeos)',
        596.12,
        0,
        0
    ), (
        264,
        'Gorduras e óleos',
        'Margarina, com óleo hidrogenado, sem sal (80% de lipídeos)',
        722.53,
        0,
        0
    ), (
        265,
        'Gorduras e óleos',
        'Margarina, com óleo interesterificado, com sal (65%de lipídeos)',
        594.45,
        0,
        0
    ), (
        266,
        'Gorduras e óleos',
        'Margarina, com óleo interesterificado, sem sal (65% de lipídeos)',
        593.14,
        0,
        0
    ), (
        267,
        'Gorduras e óleos',
        'Óleo, de babaçu',
        884,
        0,
        0
    ), (
        268,
        'Gorduras e óleos',
        'Óleo, de canola',
        884,
        0,
        0
    ), (
        269,
        'Gorduras e óleos',
        'Óleo, de girassol',
        884,
        0,
        0
    ), (
        270,
        'Gorduras e óleos',
        'Óleo, de milho',
        884,
        0,
        0
    ), (
        271,
        'Gorduras e óleos',
        'Óleo, de pequi',
        884,
        0,
        0
    ), (
        272,
        'Gorduras e óleos',
        'Óleo, de soja',
        884,
        0,
        0
    ), (
        273,
        'Pescados e frutos do mar',
        'Abadejo, filé, congelado, assado',
        111.62,
        23.52,
        0
    ), (
        274,
        'Pescados e frutos do mar',
        'Abadejo, filé, congelado,cozido',
        91.1,
        19.35,
        0
    ), (
        275,
        'Pescados e frutos do mar',
        'Abadejo, filé, congelado, cru',
        59.11,
        13.08,
        0
    ), (
        276,
        'Pescados e frutos do mar',
        'Abadejo, filé, congelado, grelhado',
        129.64,
        27.61,
        0
    ), (
        277,
        'Pescados e frutos do mar',
        'Atum, conserva em óleo',
        165.91,
        26.19,
        0
    ), (
        278,
        'Pescados e frutos do mar',
        'Atum, fresco, cru',
        117.5,
        25.68,
        0
    ), (
        279,
        'Pescados e frutos do mar',
        'Bacalhau, salgado, cru',
        135.89,
        29.04,
        0
    ), (
        280,
        'Pescados e frutos do mar',
        'Bacalhau, salgado, refogado',
        139.66,
        23.98,
        1.22
    ), (
        281,
        'Pescados e frutos do mar',
        'Cação, posta, com farinha de trigo, frita',
        208.33,
        24.95,
        3.1
    ), (
        282,
        'Pescados e frutos do mar',
        'Cação, posta, cozida',
        116.01,
        25.59,
        0
    ), (
        283,
        'Pescados e frutos do mar',
        'Cação, posta, crua',
        83.33,
        17.85,
        0
    ), (
        284,
        'Pescados e frutos do mar',
        'Camarão, Rio Grande, grande, cozido',
        90.01,
        18.97,
        0
    ), (
        285,
        'Pescados e frutos do mar',
        'Camarão, Rio Grande, grande, cru',
        47.18,
        9.99,
        0
    ), (
        286,
        'Pescados e frutos do mar',
        'Camarão, Sete Barbas, sem cabeça, com casca, frito',
        231.25,
        18.39,
        2.88
    ), (
        287,
        'Pescados e frutos do mar',
        'Caranguejo, cozido',
        82.72,
        18.48,
        0
    ), (
        288,
        'Pescados e frutos do mar',
        'Corimba, cru',
        128.16,
        17.37,
        -0.03
    ), (
        289,
        'Pescados e frutos do mar',
        'Corimbatá, assado',
        261.45,
        19.9,
        0
    ), (
        290,
        'Pescados e frutos do mar',
        'Corimbatá, cozido',
        238.7,
        20.13,
        0
    ), (
        291,
        'Pescados e frutos do mar',
        'Corvina de água doce, crua',
        101.01,
        18.92,
        0
    ), (
        292,
        'Pescados e frutos do mar',
        'Corvina do mar, crua',
        94,
        18.57,
        0
    ), (
        293,
        'Pescados e frutos do mar',
        'Corvina grande, assada',
        146.53,
        26.77,
        0
    ), (
        294,
        'Pescados e frutos do mar',
        'Corvina grande, cozida',
        100.08,
        23.44,
        0
    ), (
        295,
        'Pescados e frutos do mar',
        'Dourada de água doce, fresca',
        131.21,
        18.81,
        0
    ), (
        296,
        'Pescados e frutos do mar',
        'Lambari, congelado, cru',
        130.84,
        16.81,
        0
    ), (
        297,
        'Pescados e frutos do mar',
        'Lambari, congelado, frito',
        326.87,
        28.43,
        0
    ), (
        298,
        'Pescados e frutos do mar',
        'Lambari, fresco, cru',
        151.6,
        15.65,
        0
    ), (
        299,
        'Pescados e frutos do mar',
        'Manjuba, com farinha de trigo, frita',
        343.55,
        23.45,
        10.24
    ), (
        300,
        'Pescados e frutos do mar',
        'Manjuba, frita',
        349.33,
        30.14,
        0
    ), (
        301,
        'Pescados e frutos do mar',
        'Merluza, filé, assado',
        121.91,
        26.6,
        0
    ), (
        302,
        'Pescados e frutos do mar',
        'Merluza, filé, cru',
        89.13,
        16.61,
        0
    ), (
        303,
        'Pescados e frutos do mar',
        'Merluza, filé, frito',
        191.63,
        26.93,
        0
    ), (
        304,
        'Pescados e frutos do mar',
        'Pescada, branca, crua',
        110.88,
        16.26,
        0
    ), (
        305,
        'Pescados e frutos do mar',
        'Pescada, branca, frita',
        223.04,
        27.36,
        0
    ), (
        306,
        'Pescados e frutos do mar',
        'Pescada, filé, com farinha de trigo, frito',
        283.43,
        21.44,
        5.03
    ), (
        307,
        'Pescados e frutos do mar',
        'Pescada, filé, cru',
        107.21,
        16.65,
        0
    ), (
        308,
        'Pescados e frutos do mar',
        'Pescada, filé, frito',
        154.27,
        28.59,
        0
    ), (
        309,
        'Pescados e frutos do mar',
        'Pescada, filé, molho escabeche',
        141.96,
        11.75,
        5.02
    ), (
        310,
        'Pescados e frutos do mar',
        'Pescadinha, crua',
        76.41,
        15.48,
        0
    ), (
        311,
        'Pescados e frutos do mar',
        'Pintado, assado',
        191.56,
        36.45,
        0
    ), (
        312,
        'Pescados e frutos do mar',
        'Pintado, cru',
        91.08,
        18.56,
        0
    ), (
        313,
        'Pescados e frutos do mar',
        'Pintado, grelhado',
        152.19,
        30.8,
        0
    ), (
        314,
        'Pescados e frutos do mar',
        'Porquinho, cru',
        93.02,
        20.49,
        0
    ), (
        315,
        'Pescados e frutos do mar',
        'Salmão, filé, com pele, fresco,  grelhado',
        228.73,
        23.92,
        0
    ), (
        316,
        'Pescados e frutos do mar',
        'Salmão, sem pele, fresco, cru',
        169.78,
        19.25,
        0
    ), (
        317,
        'Pescados e frutos do mar',
        'Salmão, sem pele, fresco, grelhado',
        242.71,
        26.14,
        0
    ), (
        318,
        'Pescados e frutos do mar',
        'Sardinha, assada',
        164.35,
        32.18,
        0
    ), (
        319,
        'Pescados e frutos do mar',
        'Sardinha, conserva em óleo',
        284.98,
        15.94,
        0
    ), (
        320,
        'Pescados e frutos do mar',
        'Sardinha, frita',
        257.04,
        33.38,
        0
    ), (
        321,
        'Pescados e frutos do mar',
        'Sardinha, inteira, crua',
        113.9,
        21.08,
        0
    ), (
        322,
        'Pescados e frutos do mar',
        'Tucunaré, filé, congelado, cru',
        87.69,
        17.96,
        -0.04
    ), (
        323,
        'Carnes e derivados',
        'Apresuntado',
        128.86,
        13.45,
        2.86
    ), (
        324,
        'Carnes e derivados',
        'Caldo de carne, tablete',
        240.62,
        7.82,
        15.05
    ), (
        325,
        'Carnes e derivados',
        'Caldo de galinha, tablete',
        251.45,
        6.28,
        10.65
    ), (
        326,
        'Carnes e derivados',
        'Carne, bovina, acém, moído, cozido',
        212.42,
        26.69,
        0
    ), (
        327,
        'Carnes e derivados',
        'Carne, bovina, acém, moído, cru',
        136.56,
        19.42,
        0
    ), (
        328,
        'Carnes e derivados',
        'Carne, bovina, acém, sem gordura, cozido',
        214.61,
        27.27,
        0
    ), (
        329,
        'Carnes e derivados',
        'Carne, bovina, acém, sem gordura, cru',
        144.03,
        20.82,
        0
    ), (
        330,
        'Carnes e derivados',
        'Carne, bovina, almôndegas, cruas',
        189.26,
        12.31,
        9.79
    ), (
        331,
        'Carnes e derivados',
        'Carne, bovina, almôndegas, fritas',
        271.81,
        18.16,
        14.29
    ), (
        332,
        'Carnes e derivados',
        'Carne, bovina, bucho, cozido',
        133.02,
        21.64,
        0
    ), (
        333,
        'Carnes e derivados',
        'Carne, bovina, bucho, cru',
        137.3,
        20.53,
        0
    ), (
        334,
        'Carnes e derivados',
        'Carne, bovina, capa de contra-filé, com gordura, crua',
        216.91,
        19.2,
        0
    ), (
        335,
        'Carnes e derivados',
        'Carne, bovina, capa de contra-filé, com gordura, grelhada',
        311.7,
        30.69,
        0
    ), (
        336,
        'Carnes e derivados',
        'Carne, bovina, capa de contra-filé, sem gordura, crua',
        131.06,
        21.54,
        0
    ), (
        337,
        'Carnes e derivados',
        'Carne, bovina, capa de contra-filé, sem gordura, grelhada',
        239.44,
        35.06,
        -0.01
    ), (
        338,
        'Carnes e derivados',
        'Carne, bovina, charque, cozido',
        262.78,
        36.36,
        0
    ), (
        339,
        'Carnes e derivados',
        'Carne, bovina, charque, cru',
        248.86,
        22.71,
        0
    ), (
        340,
        'Carnes e derivados',
        'Carne, bovina, contra-filé, à milanesa',
        351.59,
        20.61,
        12.17
    ), (
        341,
        'Carnes e derivados',
        'Carne, bovina, contra-filé de costela, cru',
        202.44,
        19.8,
        0
    ), (
        342,
        'Carnes e derivados',
        'Carne, bovina, contra-filé de costela, grelhado',
        274.91,
        29.88,
        0
    ), (
        343,
        'Carnes e derivados',
        'Carne, bovina, contra-filé, com gordura, cru',
        205.86,
        21.15,
        0
    ), (
        344,
        'Carnes e derivados',
        'Carne, bovina, contra-filé, com gordura, grelhado',
        278.05,
        32.4,
        0
    ), (
        345,
        'Carnes e derivados',
        'Carne, bovina, contra-filé, sem gordura, cru',
        156.62,
        24,
        0
    ), (
        346,
        'Carnes e derivados',
        'Carne, bovina, contra-filé, sem gordura, grelhado',
        193.69,
        35.88,
        0
    ), (
        347,
        'Carnes e derivados',
        'Carne, bovina, costela, assada',
        373.04,
        28.81,
        0
    ), (
        348,
        'Carnes e derivados',
        'Carne, bovina, costela, crua',
        357.72,
        16.71,
        0
    ), (
        349,
        'Carnes e derivados',
        'Carne, bovina, coxão duro, sem gordura, cozido',
        216.62,
        31.88,
        0
    ), (
        350,
        'Carnes e derivados',
        'Carne, bovina, coxão duro, sem gordura, cru',
        147.97,
        21.51,
        0
    ), (
        351,
        'Carnes e derivados',
        'Carne, bovina, coxão mole, sem gordura, cozido',
        218.68,
        32.38,
        0
    ), (
        352,
        'Carnes e derivados',
        'Carne, bovina, coxão mole, sem gordura, cru',
        169.07,
        21.23,
        0
    ), (
        353,
        'Carnes e derivados',
        'Carne, bovina, cupim, assado',
        330.1,
        28.63,
        0
    ), (
        354,
        'Carnes e derivados',
        'Carne, bovina, cupim, cru',
        221.4,
        19.54,
        0
    ), (
        355,
        'Carnes e derivados',
        'Carne, bovina, fígado, cru',
        141.05,
        20.71,
        1.11
    ), (
        356,
        'Carnes e derivados',
        'Carne, bovina, fígado, grelhado',
        225.03,
        29.86,
        4.2
    ), (
        357,
        'Carnes e derivados',
        'Carne, bovina, filé mingnon, sem gordura, cru',
        142.86,
        21.6,
        0
    ), (
        358,
        'Carnes e derivados',
        'Carne, bovina, filé mingnon, sem gordura, grelhado',
        219.7,
        32.8,
        0
    ), (
        359,
        'Carnes e derivados',
        'Carne, bovina, flanco, sem gordura, cozido',
        195.58,
        29.38,
        0
    ), (
        360,
        'Carnes e derivados',
        'Carne, bovina, flanco, sem gordura, cru',
        141.46,
        20,
        0
    ), (
        361,
        'Carnes e derivados',
        'Carne, bovina, fraldinha, com gordura, cozida',
        338.45,
        24.24,
        0
    ), (
        362,
        'Carnes e derivados',
        'Carne, bovina, fraldinha, com gordura, crua',
        220.72,
        17.58,
        0
    ), (
        363,
        'Carnes e derivados',
        'Carne, bovina, lagarto, cozido',
        222.47,
        32.86,
        0
    ), (
        364,
        'Carnes e derivados',
        'Carne, bovina, lagarto, cru',
        134.86,
        20.54,
        0
    ), (
        365,
        'Carnes e derivados',
        'Carne, bovina, língua, cozida',
        314.9,
        21.37,
        0
    ), (
        366,
        'Carnes e derivados',
        'Carne, bovina, língua, crua',
        215.25,
        17.09,
        0
    ), (
        367,
        'Carnes e derivados',
        'Carne, bovina, maminha, crua',
        152.77,
        20.93,
        0
    ), (
        368,
        'Carnes e derivados',
        'Carne, bovina, maminha, grelhada',
        153.09,
        30.74,
        0
    ), (
        369,
        'Carnes e derivados',
        'Carne, bovina, miolo de alcatra, sem gordura, cru',
        162.87,
        21.61,
        0
    ), (
        370,
        'Carnes e derivados',
        'Carne, bovina, miolo de alcatra, sem gordura, grelhado',
        241.36,
        31.93,
        0
    ), (
        371,
        'Carnes e derivados',
        'Carne, bovina, músculo, sem gordura, cozido',
        193.8,
        31.23,
        0
    ), (
        372,
        'Carnes e derivados',
        'Carne, bovina, músculo, sem gordura, cru',
        141.58,
        21.56,
        0
    ), (
        373,
        'Carnes e derivados',
        'Carne, bovina, paleta, com gordura, crua',
        158.71,
        21.41,
        0
    ), (
        374,
        'Carnes e derivados',
        'Carne, bovina, paleta, sem gordura, cozida',
        193.65,
        29.72,
        0
    ), (
        375,
        'Carnes e derivados',
        'Carne, bovina, paleta, sem gordura, crua',
        140.94,
        21.03,
        0
    ), (
        376,
        'Carnes e derivados',
        'Carne, bovina, patinho, sem gordura, cru',
        133.47,
        21.72,
        0
    ), (
        377,
        'Carnes e derivados',
        'Carne, bovina, patinho, sem gordura, grelhado',
        219.26,
        35.9,
        0
    ), (
        378,
        'Carnes e derivados',
        'Carne, bovina, peito, sem gordura, cozido',
        338.47,
        22.25,
        0
    ), (
        379,
        'Carnes e derivados',
        'Carne, bovina, peito, sem gordura, cru',
        259.28,
        17.56,
        0
    ), (
        380,
        'Carnes e derivados',
        'Carne, bovina, picanha, com gordura, crua',
        212.88,
        18.82,
        0
    ), (
        381,
        'Carnes e derivados',
        'Carne, bovina, picanha, com gordura, grelhada',
        288.77,
        26.42,
        0
    ), (
        382,
        'Carnes e derivados',
        'Carne, bovina, picanha, sem gordura, crua',
        133.52,
        21.25,
        0
    ), (
        383,
        'Carnes e derivados',
        'Carne, bovina, picanha, sem gordura, grelhada',
        238.47,
        31.91,
        0
    ), (
        384,
        'Carnes e derivados',
        'Carne, bovina, seca, cozida',
        312.8,
        26.93,
        0
    ), (
        385,
        'Carnes e derivados',
        'Carne, bovina, seca, crua',
        312.75,
        19.66,
        0
    ), (
        386,
        'Carnes e derivados',
        'Coxinha de frango, frita',
        283.05,
        9.61,
        34.52
    ), (
        387,
        'Carnes e derivados',
        'Croquete, de carne, cru',
        245.77,
        12.04,
        13.95
    ), (
        388,
        'Carnes e derivados',
        'Croquete, de carne, frito',
        346.74,
        16.86,
        18.15
    ), (
        389,
        'Carnes e derivados',
        'Empada de frango, pré-cozida, assada',
        358.19,
        6.94,
        47.49
    ), (
        390,
        'Carnes e derivados',
        'Empada, de frango, pré-cozida',
        377.48,
        7.34,
        35.53
    ), (
        391,
        'Carnes e derivados',
        'Frango, asa, com pele, crua',
        213.19,
        18.1,
        0
    ), (
        392,
        'Carnes e derivados',
        'Frango, caipira, inteiro, com pele, cozido',
        242.89,
        23.88,
        0
    ), (
        393,
        'Carnes e derivados',
        'Frango, caipira, inteiro, sem pele, cozido',
        195.76,
        29.57,
        0
    ), (
        394,
        'Carnes e derivados',
        'Frango, coração, cru',
        221.5,
        12.58,
        0
    ), (
        395,
        'Carnes e derivados',
        'Frango, coração, grelhado',
        207.27,
        22.44,
        0.61
    ), (
        396,
        'Carnes e derivados',
        'Frango, coxa, com pele, assada',
        215.12,
        28.49,
        0.06
    ), (
        397,
        'Carnes e derivados',
        'Frango, coxa, com pele, crua',
        161.47,
        17.09,
        0
    ), (
        398,
        'Carnes e derivados',
        'Frango, coxa, sem pele, cozida',
        167.43,
        26.86,
        0
    ), (
        399,
        'Carnes e derivados',
        'Frango, coxa, sem pele, crua',
        119.95,
        17.81,
        0.02
    ), (
        400,
        'Carnes e derivados',
        'Frango, fígado, cru',
        106.48,
        17.59,
        -0.02
    ), (
        401,
        'Carnes e derivados',
        'Frango, filé, à milanesa',
        220.87,
        28.46,
        7.51
    ), (
        402,
        'Carnes e derivados',
        'Frango, inteiro, com pele, cru',
        226.32,
        16.44,
        0
    ), (
        403,
        'Carnes e derivados',
        'Frango, inteiro, sem pele, assado',
        187.34,
        28.02,
        0
    ), (
        404,
        'Carnes e derivados',
        'Frango, inteiro, sem pele, cozido',
        170.39,
        24.99,
        0
    ), (
        405,
        'Carnes e derivados',
        'Frango, inteiro, sem pele, cru',
        129.1,
        20.59,
        0
    ), (
        406,
        'Carnes e derivados',
        'Frango, peito, com pele, assado',
        211.68,
        33.42,
        0
    ), (
        407,
        'Carnes e derivados',
        'Frango, peito, com pele, cru',
        149.47,
        20.78,
        0
    ), (
        408,
        'Carnes e derivados',
        'Frango, peito, sem pele, cozido',
        162.87,
        31.47,
        0
    ), (
        409,
        'Carnes e derivados',
        'Frango, peito, sem pele, cru',
        119.16,
        21.53,
        0
    ), (
        410,
        'Carnes e derivados',
        'Frango, peito, sem pele, grelhado',
        159.19,
        32.03,
        0
    ), (
        411,
        'Carnes e derivados',
        'Frango, sobrecoxa, com pele, assada',
        259.6,
        28.7,
        0
    ), (
        412,
        'Carnes e derivados',
        'Frango, sobrecoxa, com pele, crua',
        254.53,
        15.46,
        0
    ), (
        413,
        'Carnes e derivados',
        'Frango, sobrecoxa, sem pele, assada',
        232.88,
        29.18,
        0
    ), (
        414,
        'Carnes e derivados',
        'Frango, sobrecoxa, sem pele, crua',
        161.8,
        17.57,
        0
    ), (
        415,
        'Carnes e derivados',
        'Hambúrguer, bovino, cru',
        214.84,
        13.16,
        4.15
    ), (
        416,
        'Carnes e derivados',
        'Hambúrguer, bovino, frito',
        258.28,
        19.97,
        6.32
    ), (
        417,
        'Carnes e derivados',
        'Hambúrguer, bovino, grelhado',
        209.83,
        13.16,
        11.33
    ), (
        418,
        'Carnes e derivados',
        'Lingüiça, frango, crua',
        218.11,
        14.24,
        0
    ), (
        419,
        'Carnes e derivados',
        'Lingüiça, frango, frita',
        245.46,
        18.32,
        0
    ), (
        420,
        'Carnes e derivados',
        'Lingüiça, frango, grelhada',
        243.66,
        18.19,
        0
    ), (
        421,
        'Carnes e derivados',
        'Lingüiça, porco, crua',
        227.2,
        16.06,
        0
    ), (
        422,
        'Carnes e derivados',
        'Lingüiça, porco, frita',
        279.54,
        20.45,
        0
    ), (
        423,
        'Carnes e derivados',
        'Lingüiça, porco, grelhada',
        296.49,
        23.17,
        0
    ), (
        424,
        'Carnes e derivados',
        'Mortadela',
        268.82,
        11.95,
        5.82
    ), (
        425,
        'Carnes e derivados',
        'Peru, congelado, assado',
        163.07,
        26.2,
        0
    ), (
        426,
        'Carnes e derivados',
        'Peru, congelado, cru',
        93.72,
        18.08,
        0
    ), (
        427,
        'Carnes e derivados',
        'Porco, bisteca, crua',
        164.12,
        21.5,
        0
    ), (
        428,
        'Carnes e derivados',
        'Porco, bisteca, frita',
        311.17,
        33.75,
        0
    ), (
        429,
        'Carnes e derivados',
        'Porco, bisteca, grelhada',
        280.08,
        28.89,
        0
    ), (
        430,
        'Carnes e derivados',
        'Porco, costela, assada',
        402.17,
        30.22,
        0
    ), (
        431,
        'Carnes e derivados',
        'Porco, costela, crua',
        255.61,
        18,
        0
    ), (
        432,
        'Carnes e derivados',
        'Porco, lombo, assado',
        210.23,
        35.73,
        0
    ), (
        433,
        'Carnes e derivados',
        'Porco, lombo, cru',
        175.63,
        22.6,
        0
    ), (
        434,
        'Carnes e derivados',
        'Porco, orelha, salgada, crua',
        258.49,
        18.52,
        0
    ), (
        435,
        'Carnes e derivados',
        'Porco, pernil, assado',
        262.26,
        32.13,
        0
    ), (
        436,
        'Carnes e derivados',
        'Porco, pernil, cru',
        186.06,
        20.13,
        0
    ), (
        437,
        'Carnes e derivados',
        'Porco, rabo, salgado, cru',
        377.42,
        15.58,
        0
    ), (
        438,
        'Carnes e derivados',
        'Presunto, com capa de gordura',
        127.85,
        14.37,
        1.4
    ), (
        439,
        'Carnes e derivados',
        'Presunto, sem capa de gordura',
        93.74,
        14.29,
        2.15
    ), (
        440,
        'Carnes e derivados',
        'Quibe, assado',
        136.23,
        14.59,
        12.86
    ), (
        441,
        'Carnes e derivados',
        'Quibe, cru',
        109.49,
        12.35,
        10.77
    ), (
        442,
        'Carnes e derivados',
        'Quibe, frito',
        253.83,
        14.89,
        12.34
    ), (
        443,
        'Carnes e derivados',
        'Salame',
        397.84,
        25.81,
        2.91
    ), (
        444,
        'Carnes e derivados',
        'Toucinho, cru',
        592.53,
        11.48,
        0
    ), (
        445,
        'Carnes e derivados',
        'Toucinho, frito',
        696.56,
        27.28,
        0
    ), (
        446,
        'Leite e derivados',
        'Bebida láctea, pêssego',
        55.16,
        2.13,
        7.57
    ), (
        447,
        'Leite e derivados',
        'Creme de Leite',
        221.48,
        1.51,
        4.51
    ), (
        448,
        'Leite e derivados',
        'Iogurte, natural',
        51.49,
        4.06,
        1.92
    ), (
        449,
        'Leite e derivados',
        'Iogurte, natural, desnatado',
        41.49,
        3.83,
        5.77
    ), (
        450,
        'Leite e derivados',
        'Iogurte, sabor abacaxi',
        0,
        0,
        0
    ), (
        451,
        'Leite e derivados',
        'Iogurte, sabor morango',
        69.57,
        2.71,
        9.69
    ), (
        452,
        'Leite e derivados',
        'Iogurte, sabor pêssego',
        67.85,
        2.53,
        9.43
    ), (
        453,
        'Leite e derivados',
        'Leite, condensado',
        312.57,
        7.67,
        57
    ), (
        454,
        'Leite e derivados',
        'Leite, de cabra',
        66.42,
        3.07,
        5.25
    ), (
        455,
        'Leite e derivados',
        'Leite, de vaca, achocolatado',
        82.82,
        2.1,
        14.16
    ), (
        456,
        'Leite e derivados',
        'Leite, de vaca, desnatado, pó',
        361.61,
        34.69,
        53.04
    ), (
        457,
        'Leite e derivados',
        'Leite, de vaca, desnatado, UHT',
        0,
        0,
        0
    ), (
        458,
        'Leite e derivados',
        'Leite, de vaca, integral',
        0,
        0,
        0
    ), (
        459,
        'Leite e derivados',
        'Leite, de vaca, integral, pó',
        496.65,
        25.42,
        39.18
    ), (
        460,
        'Leite e derivados',
        'Leite, fermentado',
        69.62,
        1.89,
        15.67
    ), (
        461,
        'Leite e derivados',
        'Queijo, minas, frescal',
        264.27,
        17.41,
        3.24
    ), (
        462,
        'Leite e derivados',
        'Queijo, minas, meia cura',
        320.72,
        21.21,
        3.57
    ), (
        463,
        'Leite e derivados',
        'Queijo, mozarela',
        329.87,
        22.65,
        3.05
    ), (
        464,
        'Leite e derivados',
        'Queijo, parmesão',
        452.96,
        35.55,
        1.66
    ), (
        465,
        'Leite e derivados',
        'Queijo, pasteurizado',
        303.08,
        9.36,
        5.68
    ), (
        466,
        'Leite e derivados',
        'Queijo, petit suisse, morango',
        121.11,
        5.79,
        18.46
    ), (
        467,
        'Leite e derivados',
        'Queijo, prato',
        359.88,
        22.66,
        1.88
    ), (
        468,
        'Leite e derivados',
        'Queijo, requeijão, cremoso',
        256.58,
        9.63,
        2.43
    ), (
        469,
        'Leite e derivados',
        'Queijo, ricota',
        139.73,
        12.6,
        3.79
    ), (
        470,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Bebida isotônica, sabores variados',
        25.61,
        0,
        6.4
    ), (
        471,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Café, infusão 10%',
        9.07,
        0.71,
        1.48
    ), (
        472,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Cana, aguardente 1',
        215.66,
        0,
        0
    ), (
        473,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Cana, caldo de',
        65.34,
        0,
        18.15
    ), (
        474,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Cerveja, pilsen 2',
        40.72,
        0.56,
        3.32
    ), (
        475,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Chá, erva-doce, infusão 5%',
        1.4,
        0,
        0.39
    ), (
        476,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Chá, mate, infusão 5%',
        2.73,
        0,
        0.64
    ), (
        477,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Chá, preto, infusão 5%',
        2.25,
        0,
        0.63
    ), (
        478,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Coco, água de',
        21.51,
        0,
        5.28
    ), (
        479,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Refrigerante, tipo água tônica',
        30.78,
        0,
        7.95
    ), (
        480,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Refrigerante, tipo cola',
        33.51,
        0,
        8.66
    ), (
        481,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Refrigerante, tipo guaraná',
        38.7,
        0,
        10
    ), (
        482,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Refrigerante, tipo laranja',
        45.63,
        0,
        11.79
    ), (
        483,
        'Bebidas (alcoólicas e não alcoólicas)',
        'Refrigerante, tipo limão',
        39.72,
        0,
        10.26
    ), (
        484,
        'Ovos e derivados',
        'Omelete, de queijo',
        268.01,
        15.57,
        0.44
    ), (
        485,
        'Ovos e derivados',
        'Ovo, de codorna, inteiro, cru',
        176.89,
        13.69,
        0.77
    ), (
        486,
        'Ovos e derivados',
        'Ovo, de galinha, clara, cozida/10minutos',
        59.44,
        13.45,
        0
    ), (
        487,
        'Ovos e derivados',
        'Ovo, de galinha, gema, cozida/10minutos',
        352.67,
        15.9,
        1.56
    ), (
        488,
        'Ovos e derivados',
        'Ovo, de galinha, inteiro, cozido/10minutos',
        145.7,
        13.29,
        0.61
    ), (
        489,
        'Ovos e derivados',
        'Ovo, de galinha, inteiro, cru',
        143.11,
        13.03,
        1.64
    ), (
        490,
        'Ovos e derivados',
        'Ovo, de galinha, inteiro, frito',
        240.19,
        15.62,
        1.19
    ), (
        491,
        'Produtos açucarados',
        'Achocolatado, pó',
        401.02,
        4.2,
        91.18
    ), (
        492,
        'Produtos açucarados',
        'Açúcar, cristal',
        386.85,
        0.32,
        99.61
    ), (
        493,
        'Produtos açucarados',
        'Açúcar, mascavo',
        368.55,
        0.76,
        94.45
    ), (
        494,
        'Produtos açucarados',
        'Açúcar, refinado',
        386.57,
        0.32,
        99.54
    ), (
        495,
        'Produtos açucarados',
        'Chocolate, ao leite',
        539.59,
        7.22,
        59.58
    ), (
        496,
        'Produtos açucarados',
        'Chocolate, ao leite, com castanha do Pará',
        558.88,
        7.41,
        55.38
    ), (
        497,
        'Produtos açucarados',
        'Chocolate, ao leite, dietético',
        556.82,
        6.9,
        56.32
    ), (
        498,
        'Produtos açucarados',
        'Chocolate, meio amargo',
        474.92,
        4.86,
        62.42
    ), (
        499,
        'Produtos açucarados',
        'Cocada branca',
        448.85,
        1.12,
        81.38
    ), (
        500,
        'Produtos açucarados',
        'Doce, de abóbora, cremoso',
        198.94,
        0.92,
        54.61
    ), (
        501,
        'Produtos açucarados',
        'Doce, de leite, cremoso',
        306.31,
        5.48,
        59.49
    ), (
        502,
        'Produtos açucarados',
        'Geléia, mocotó, natural',
        106.09,
        2.13,
        24.23
    ), (
        503,
        'Produtos açucarados',
        'Glicose de milho',
        292.12,
        0,
        79.38
    ), (
        504,
        'Produtos açucarados',
        'Maria mole',
        301.24,
        3.81,
        73.55
    ), (
        505,
        'Produtos açucarados',
        'Maria mole, coco queimado',
        306.63,
        3.93,
        75.06
    ), (
        506,
        'Produtos açucarados',
        'Marmelada',
        257.24,
        0.4,
        70.76
    ), (
        507,
        'Produtos açucarados',
        'Mel, de abelha',
        309.24,
        0,
        84.03
    ), (
        508,
        'Produtos açucarados',
        'Melado',
        296.51,
        0,
        76.62
    ), (
        509,
        'Produtos açucarados',
        'Quindim',
        411.35,
        4.74,
        46.3
    ), (
        510,
        'Produtos açucarados',
        'Rapadura',
        351.96,
        0.99,
        90.79
    ), (
        511,
        'Miscelâneas',
        'Café, pó, torrado',
        418.62,
        14.7,
        65.75
    ), (
        512,
        'Miscelâneas',
        'Capuccino, pó',
        417.41,
        11.31,
        73.61
    ), (
        513,
        'Miscelâneas',
        'Fermento em pó, químico',
        89.72,
        0.48,
        43.91
    ), (
        514,
        'Miscelâneas',
        'Fermento, biológico, levedura, tablete',
        89.79,
        16.96,
        7.7
    ), (
        515,
        'Miscelâneas',
        'Gelatina, sabores variados, pó',
        380.22,
        8.89,
        89.22
    ), (
        516,
        'Miscelâneas',
        'Sal, dietético',
        0,
        0,
        0
    ), (
        517,
        'Miscelâneas',
        'Sal, grosso',
        0,
        0,
        0
    ), (
        518,
        'Miscelâneas',
        'Shoyu',
        60.93,
        3.31,
        11.65
    ), (
        519,
        'Miscelâneas',
        'Tempero a base de sal',
        21.33,
        2.67,
        2.07
    ), (
        520,
        'Outros alimentos industrializados',
        'Azeitona, preta, conserva',
        194.15,
        1.16,
        5.54
    ), (
        521,
        'Outros alimentos industrializados',
        'Azeitona, verde, conserva',
        136.94,
        0.95,
        4.1
    ), (
        522,
        'Outros alimentos industrializados',
        'Chantilly, spray, com gordura vegetal',
        314.96,
        0.53,
        16.86
    ), (
        523,
        'Outros alimentos industrializados',
        'Leite, de coco',
        166.16,
        1.01,
        2.19
    ), (
        524,
        'Outros alimentos industrializados',
        'Maionese, tradicional com ovos',
        302.15,
        0.58,
        7.9
    ), (
        525,
        'Alimentos preparados',
        'Acarajé',
        289.21,
        8.35,
        19.11
    ), (
        526,
        'Alimentos preparados',
        'Arroz carreteiro',
        153.77,
        10.83,
        11.58
    ), (
        527,
        'Alimentos preparados',
        'Baião de dois, arroz e feijão-de-corda',
        135.68,
        6.24,
        20.42
    ), (
        528,
        'Alimentos preparados',
        'Barreado',
        164.98,
        18.27,
        0.24
    ), (
        529,
        'Alimentos preparados',
        'Bife à cavalo, com contra filé',
        291.23,
        23.66,
        0
    ), (
        530,
        'Alimentos preparados',
        'Bolinho de arroz',
        273.51,
        8.04,
        41.68
    ), (
        531,
        'Alimentos preparados',
        'Camarão à baiana',
        100.78,
        7.94,
        3.17
    ), (
        532,
        'Alimentos preparados',
        'Charuto, de repolho',
        78.23,
        6.78,
        10.13
    ), (
        533,
        'Alimentos preparados',
        'Cuscuz, de milho, cozido com sal',
        113.46,
        2.16,
        25.28
    ), (
        534,
        'Alimentos preparados',
        'Cuscuz, paulista',
        142.12,
        2.56,
        22.51
    ), (
        535,
        'Alimentos preparados',
        'Cuxá, molho',
        80.09,
        5.64,
        5.74
    ), (
        536,
        'Alimentos preparados',
        'Dobradinha',
        124.5,
        19.77,
        0
    ), (
        537,
        'Alimentos preparados',
        'Estrogonofe de carne',
        173.14,
        15.03,
        2.98
    ), (
        538,
        'Alimentos preparados',
        'Estrogonofe de frango',
        156.81,
        17.55,
        2.59
    ), (
        539,
        'Alimentos preparados',
        'Feijão tropeiro mineiro',
        151.56,
        10.17,
        19.58
    ), (
        540,
        'Alimentos preparados',
        'Feijoada',
        116.93,
        8.67,
        11.64
    ), (
        541,
        'Alimentos preparados',
        'Frango, com açafrão',
        112.78,
        9.7,
        4.06
    ), (
        542,
        'Alimentos preparados',
        'Macarrão, molho bolognesa',
        119.53,
        4.93,
        22.52
    ), (
        543,
        'Alimentos preparados',
        'Maniçoba',
        134.22,
        9.96,
        3.42
    ), (
        544,
        'Alimentos preparados',
        'Quibebe',
        86.35,
        8.56,
        6.64
    ), (
        545,
        'Alimentos preparados',
        'Salada, de legumes, com maionese',
        96.1,
        1.05,
        8.92
    ), (
        546,
        'Alimentos preparados',
        'Salada, de legumes, cozida no vapor',
        35.41,
        2.01,
        7.09
    ), (
        547,
        'Alimentos preparados',
        'Salpicão, de frango',
        147.86,
        13.93,
        4.57
    ), (
        548,
        'Alimentos preparados',
        'Sarapatel',
        122.98,
        18.47,
        1.09
    ), (
        549,
        'Alimentos preparados',
        'Tabule',
        57.45,
        2.05,
        10.58
    ), (
        550,
        'Alimentos preparados',
        'Tacacá',
        46.89,
        6.96,
        3.39
    ), (
        551,
        'Alimentos preparados',
        'Tapioca, com manteiga',
        347.83,
        0.09,
        63.59
    ), (
        552,
        'Alimentos preparados',
        'Tucupi, com pimenta-de-cheiro',
        27.18,
        2.06,
        4.74
    ), (
        553,
        'Alimentos preparados',
        'Vaca atolada',
        144.9,
        5.12,
        10.06
    ), (
        554,
        'Alimentos preparados',
        'Vatapá',
        254.89,
        6,
        9.75
    ), (
        555,
        'Alimentos preparados',
        'Virado à paulista',
        306.95,
        10.18,
        14.11
    ), (
        556,
        'Alimentos preparados',
        'Yakisoba',
        112.8,
        7.52,
        18.25
    ), (
        557,
        'Leguminosas e derivados',
        'Amendoim, grão, cru',
        544.05,
        27.19,
        20.31
    ), (
        558,
        'Leguminosas e derivados',
        'Amendoim, torrado, salgado',
        605.78,
        22.48,
        18.7
    ), (
        559,
        'Leguminosas e derivados',
        'Ervilha, em vagem',
        88.09,
        7.45,
        14.23
    ), (
        560,
        'Leguminosas e derivados',
        'Ervilha, enlatada, drenada',
        73.84,
        4.6,
        13.44
    ), (
        561,
        'Leguminosas e derivados',
        'Feijão, carioca, cozido',
        76.42,
        4.78,
        13.59
    ), (
        562,
        'Leguminosas e derivados',
        'Feijão, carioca, cru',
        329.03,
        19.98,
        61.22
    ), (
        563,
        'Leguminosas e derivados',
        'Feijão, fradinho, cozido',
        78.01,
        5.09,
        13.5
    ), (
        564,
        'Leguminosas e derivados',
        'Feijão, fradinho, cru',
        339.16,
        20.21,
        61.24
    ), (
        565,
        'Leguminosas e derivados',
        'Feijão, jalo, cozido',
        92.74,
        6.14,
        16.5
    ), (
        566,
        'Leguminosas e derivados',
        'Feijão, jalo, cru',
        327.91,
        20.1,
        61.48
    ), (
        567,
        'Leguminosas e derivados',
        'Feijão, preto, cozido',
        77.03,
        4.48,
        14.01
    ), (
        568,
        'Leguminosas e derivados',
        'Feijão, preto, cru',
        323.57,
        21.34,
        58.75
    ), (
        569,
        'Leguminosas e derivados',
        'Feijão, rajado, cozido',
        84.7,
        5.54,
        15.27
    ), (
        570,
        'Leguminosas e derivados',
        'Feijão, rajado, cru',
        325.84,
        17.27,
        62.93
    ), (
        571,
        'Leguminosas e derivados',
        'Feijão, rosinha, cozido',
        67.87,
        4.54,
        11.82
    ), (
        572,
        'Leguminosas e derivados',
        'Feijão, rosinha, cru',
        336.96,
        20.92,
        62.22
    ), (
        573,
        'Leguminosas e derivados',
        'Feijão, roxo, cozido',
        76.89,
        5.72,
        12.91
    ), (
        574,
        'Leguminosas e derivados',
        'Feijão, roxo, cru',
        331.41,
        22.17,
        59.99
    ), (
        575,
        'Leguminosas e derivados',
        'Grão-de-bico, cru',
        354.7,
        21.23,
        57.88
    ), (
        576,
        'Leguminosas e derivados',
        'Guandu, cru',
        344.13,
        18.96,
        64
    ), (
        577,
        'Leguminosas e derivados',
        'Lentilha, cozida',
        92.64,
        6.31,
        16.3
    ), (
        578,
        'Leguminosas e derivados',
        'Lentilha, crua',
        339.14,
        23.15,
        62
    ), (
        579,
        'Leguminosas e derivados',
        'Paçoca, amendoim',
        486.93,
        16,
        52.38
    ), (
        580,
        'Leguminosas e derivados',
        'Pé-de-moleque, amendoim',
        503.19,
        13.16,
        54.73
    ), (
        581,
        'Leguminosas e derivados',
        'Soja, farinha',
        403.96,
        36.03,
        38.44
    ), (
        582,
        'Leguminosas e derivados',
        'Soja, extrato solúvel, natural, fluido',
        39.1,
        2.38,
        4.28
    ), (
        583,
        'Leguminosas e derivados',
        'Soja, extrato solúvel, pó',
        458.9,
        35.69,
        28.48
    ), (
        584,
        'Leguminosas e derivados',
        'Soja, queijo (tofu)',
        64.49,
        6.55,
        2.13
    ), (
        585,
        'Leguminosas e derivados',
        'Tremoço, cru',
        381.28,
        33.58,
        43.79
    ), (
        586,
        'Leguminosas e derivados',
        'Tremoço, em conserva',
        120.64,
        11.11,
        12.39
    ), (
        587,
        'Leguminosas e derivados',
        'Amêndoa, torrada, salgada',
        580.75,
        18.55,
        29.55
    ), (
        588,
        'Leguminosas e derivados',
        'Castanha-de-caju, torrada, salgada',
        570.17,
        18.51,
        29.13
    ), (
        589,
        'Leguminosas e derivados',
        'Castanha-do-Brasil, crua',
        642.96,
        14.54,
        15.08
    ), (
        590,
        'Leguminosas e derivados',
        'Coco, cru',
        406.49,
        3.69,
        10.4
    ), (
        591,
        'Leguminosas e derivados',
        'Coco,  verde, cru',
        0,
        0,
        0
    ), (
        592,
        'Leguminosas e derivados',
        'Farinha, de mesocarpo de babaçu, crua',
        328.77,
        1.41,
        79.17
    ), (
        593,
        'Leguminosas e derivados',
        'Gergelim, semente',
        583.55,
        21.16,
        21.62
    ), (
        594,
        'Leguminosas e derivados',
        'Linhaça, semente',
        495.1,
        14.08,
        43.31
    ), (
        595,
        'Leguminosas e derivados',
        'Pinhão, cozido',
        174.37,
        2.98,
        43.92
    ), (
        596,
        'Leguminosas e derivados',
        'Pupunha, cozida',
        218.53,
        2.52,
        29.57
    ), (
        597,
        'Leguminosas e derivados',
        'Noz, crua',
        620.06,
        13.97,
        18.36
    );

CREATE TABLE
    IF NOT EXISTS meals (
        id INT PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        description varchar(255) not null default "no description",
        calories DOUBLE NOT NULL DEFAULT 0,
        user_id int not null,
        foreign key (user_id) references users(id) on delete cascade
    );
    
CREATE TABLE
    IF NOT EXISTS meals_foods(
	meal_id int not null,
    food_id int not null,
    foreign key (meal_id) references meals(id) on delete cascade,
    foreign key (food_id) references food_generics(id) on delete cascade
    );
