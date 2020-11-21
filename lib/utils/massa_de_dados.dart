import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product_model.dart';

class MassaDeDados {
  static final products = [
    ProductModel(
      name: 'Tênis Nike Todos - Masculino',
      price: 180.35,
      images: [
        "https://static.netshoes.com.br/produtos/tenis-adidas-lite-racer-20-masculino/12/NQQ-0144-012/NQQ-0144-012_zoom1.jpg?ts=1585088949",
        "https://static.netshoes.com.br/produtos/tenis-adidas-lite-racer-20-masculino/12/NQQ-0144-012/NQQ-0144-012_zoom2.jpg?ts=1585088949&",
        "https://static.netshoes.com.br/produtos/tenis-adidas-lite-racer-20-masculino/12/NQQ-0144-012/NQQ-0144-012_zoom3.jpg?ts=1585088949&",
        "https://static.netshoes.com.br/produtos/tenis-adidas-lite-racer-20-masculino/12/NQQ-0144-012/NQQ-0144-012_zoom5.jpg?ts=1585088949&"
      ],
      description:
          "Para treinos funcionais ou até mesmo usar no dia a dia, aposte no Tênis Adidas Lite Racer 20. Produzido com material respirável, conta com solado em EVA e tecnologia presente na palmilha que evita a proliferação de microrganismos e bactérias que causam o mau cheiro. Com design moderno, agrega valor ao seu visual esportivo. Garanta já o seu Tênis Adidas Masculino e turbine seu estilo.",
    ),
    ProductModel(
      name: 'Tênis Nike Todos - Masculino',
      price: 199.99,
      images: [
        "https://imgcentauro-a.akamaihd.net/900x900/952014H3/tenis-nike-todos-masculino-img.jpg",
        "https://imgcentauro-a.akamaihd.net/500x500/952014H3A1/tenis-nike-todos-masculino-img.jpg",
        "https://imgcentauro-a.akamaihd.net/500x500/952014H3A3/tenis-nike-todos-masculino-img.jpg",
      ],
      description:
          "CONTEÚDO DA EMBALAGEM  1 Par ENTRESSOLA  Espuma LINGUETA  Flexível Macia MATERIAL DO CABEDAL  Sintético PALMILHA  EVA Injetada Forrada PERFIL  Leveza Amortecimento SOLADO  Detalhes Emborrachados Em Locais Estratégicos Para Aderência E Durabilidade Em Zonas De Alto Impacto TERRENO INDICADO  Asfalto Academia/Esteira TIPO DE AMARRAÇÃO  Cadarço GARANTIA DO FORNECEDOR  Contra Defeito De Fabricação SAC DO FORNECEDOR  NIKE: São Paulo: (11) 3020-8118 Demais Localidades: 0800 703 6453 MATERIAL DO FORRO  Têxtil Reforço Acolchoado ESTAMPA DO LOGO  Estampado No Cabedal PASSANTE  Puxador Em Tecido Contraforte Traseiro",
    ),
    ProductModel(
      name: 'Tênis Mizuno Enerzy - Preto e Vermelho',
      price: 180.35,
      images: [
        "https://imgcentauro-a.akamaihd.net/900x900/952014H3/tenis-nike-todos-masculino-img.jpg",
        "https://imgcentauro-a.akamaihd.net/500x500/952014H3A1/tenis-nike-todos-masculino-img.jpg",
        "https://imgcentauro-a.akamaihd.net/500x500/952014H3A3/tenis-nike-todos-masculino-img.jpg",
        "https://imgcentauro-a.akamaihd.net/500x500/952014H3A3/tenis-nike-todos-masculino-img.jpg",
      ],
      description:
          "CONTEÚDO DA EMBALAGEM  1 Par ENTRESSOLA  Espuma LINGUETA  Flexível Macia MATERIAL DO CABEDAL  Sintético PALMILHA  EVA Injetada Forrada PERFIL  Leveza Amortecimento SOLADO  Detalhes Emborrachados Em Locais Estratégicos Para Aderência E Durabilidade Em Zonas De Alto Impacto TERRENO INDICADO  Asfalto Academia/Esteira TIPO DE AMARRAÇÃO  Cadarço GARANTIA DO FORNECEDOR  Contra Defeito De Fabricação SAC DO FORNECEDOR  NIKE: São Paulo: (11) 3020-8118 Demais Localidades: 0800 703 6453 MATERIAL DO FORRO  Têxtil Reforço Acolchoado ESTAMPA DO LOGO  Estampado No Cabedal PASSANTE  Puxador Em Tecido Contraforte Traseiro",
    ),
    ProductModel(
      name: 'Tênis Puma Flyer Runner - Marinho e Branco',
      price: 179.99,
      images: [
        "https://static.netshoes.com.br/produtos/tenis-puma-flyer-runner/36/NWG-0497-036/NWG-0497-036_zoom1.jpg?ts=1581505711",
        "https://static.netshoes.com.br/produtos/tenis-puma-flyer-runner/36/NWG-0497-036/NWG-0497-036_zoom2.jpg?ts=1581505711&",
        "https://static.netshoes.com.br/produtos/tenis-puma-flyer-runner/36/NWG-0497-036/NWG-0497-036_zoom3.jpg?ts=1581505711&",
        "https://static.netshoes.com.br/produtos/tenis-puma-flyer-runner/36/NWG-0497-036/NWG-0497-036_zoom4.jpg?ts=1581505711&",
      ],
      description:
          "Aposte em você na corrida e no Tênis Puma Flyer Runner! Versátil para percursos longos e treinos na academia, esse Tênis de correr da Puma possui um cabedal macio que oferece conforto e um entressola de EVA que oferece amortecimento e resposta. Dê a largada com o seu Tênis de corrida Puma Flyer Runner!",
    ),
    ProductModel(
      name: 'Tênis Fila Cage Python - Masculino',
      price: 159.90,
      images: [
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ1AWEjbgQt8k0Ae30BkDcfYpEtLM6tHi8tM3lcyN3qDzU-txNpBdu9vlJGxDChCuDg14NwXQq1woIpXR-v44QbiMYJ1yPbIPZBxkcWjxpnqUvgQyvxP0eHng&usqp=CAY",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSLnmVFxt_F-OsOeZcFXpa0JYkEK8rrBpkump3hRUSPfeaPsV3_aMypzJCl9RC-oK1q07MNWynG1MiLeoIy4yq5ak3R-8LWwH1JRQqz7OM&usqp=CAY",
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRyupS4f-V5j466w5BvPeib0RpocgrUGvhNOzYAvbeuwL02UKegt5OYC0hE2i3Kgk5ROkpIjdOFjyJaVsVPQkFig7c4IB5w7f6aMt2tZywrISZFWf5geF4i&usqp=CAY",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRL6CGGmk-Wyea_xgWgMTdLRxE9Z-OszgLq7kGcpzpoh5T2ENCVx-yRg7v75JCUQiK3CRMXLYu4FuLSVgJHMFkuqondIuFCscrtXxQo_bBjXemVLzZTDIBOqg&usqp=CAY",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSoEUqKa568z2XHKbxLUB2L3fn5rrmdG7bHAUJl7AgAvBKGX2txWvUczPkyfJVvYKQafDAOfx8qqLakZB62GYXRkja_t98tQyWTggvrPtPh7F5HlNsNwEcxcw&usqp=CAY",
      ],
      description:
          "Tênis Masculino Fila Cage Python possui design urbano com cabedal laminado, ideal para a rotina da cidade. Suas cores em degradê acentuam as linhas modernas do tênis. Altamente confortável, é indicado para uso no dia a dia.Aposte neste tênis para ir a academia ou praticar exercícios físicos no geral como corrida e caminhada.",
    ),
    ProductModel(
      name: 'Tênis Fila Euro Jogger Sport - Masculino',
      price: 199.99,
      images: [
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSzYPPCvovi--69vRItsOX8mF8yjsdCBUS5iNyT50vOvk-hVLXYbjmJ1oFe5GbR0aUOsKnjwia5UxJC-qCcTBXynyJ4fSYGoLEPIzk7eHLFoapRCUZUUboN&usqp=CAY",
        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcRO5etkbq5UXvy4VY7UpiCv1d2W1vtna5bH96qcF3tR99bpqQDbpUEfUpXNKLeHXl6t3niSRkcezacOeOl0BngqczxnuxAF7mn_nM3fTgd6n1WjANyCTpiu&usqp=CAY",
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQu3YFEtzyH5huDlnDGgZj3qoCw6YODnR4z50qcC6AomcJy1Nlo7iJRAcIz7wYFgbHezEF3w85wr36IsGGfebffur1pznTQCQ&usqp=CAY",
        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcR-vkpPehQ0Zh5YFhW41GSdzWel-SpAzs2G8rBxfH4TOCsPO5Wg21rRPXHnyZU0Ha8b_LvNNwBQ8ipSn1b8iPDtNqHTe_kdSUKQrBaKfKErex3t_Y78Y6WVLA&usqp=CAY",
        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQhOXbarB6ARfZ77saDylKXJ1Uwfu1ZjxCbajhRz5HTW0yA3Uerq-wJ-ZgQYY3WLT7T7tXTfaMOKUq51s2TWvPrOtMYXNhdzPdYPw6YG11oN4X7LR1w53_00Q&usqp=CAY",
      ],
      description:
          "Tênis Fila Euro Jogger Sport - Masculino Inspirado no design retrô, o Tênis Fila Jogger Euro Sport Masculino é ideal para te acompanhar no dia a dia para melhor conforto e versatilidade nas combinações. Traz material resistente ao desgaste, forro acolchoado e entressola em eva, garantindo o leve amortecimento da passada. Vá de Fila, a marca italiana que sempre pensa na autenticidade e qualidade para o seu dia a dia",
    ),
    ProductModel(
      name: 'Tênis Fila Attrek Masculino',
      price: 249.99,
      images: [
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRiOkAff_mr7rtaYUDpX3eWKRSxI2KLC_MgTkQUMu1ylF1pdBnw7YQJdJ0_rTE8DYchqkr27eBQNH5IHMZd0HSmLV95UJ3GMMOcQYsMWB9RyoYJaWkL9Ocf&usqp=CAY",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcQA_s1q8Epm1JquIkdTbykcEhrhSIsC7B6qAIvLE_hD0CZGVtvphDHQupf-LelemvTRH4ZTKvyBdnndSSdWhVzG3nHw77Hh5IcNgfVU2o3UNEoOc4NnPWq_&usqp=CAY",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcQfIm8kysd-dczq06CnHv9pDW3SbXnVvcliyVQmht4FijAzsEYDtEcwdkkxppHMAhdtmq6men1wuO9roFKQUTpok8FaYbJJgBWMcI4XTuiDY1E05RJh5gaM&usqp=CAY",
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSBCpkT9RfqYaIz8aIxuNNjzQv8cf-BbrPf2BmlaZK0KEa-3oZAkoxoNjHR8qdMpB0ifrhd9DTVq5dflyrwU9kbg1N8TBK9ueevir3CPfIzXX7n4Eot2CgsqA&usqp=CAY",
        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcT8WCn97QCoVJUgNiEj7Xqv8El6D-tdi7LQWwnxLvhO2savX6Mlmc5q6CQfq3pqnx5q4fxoTRHbu923ZOYS2moLeKYBIu39okdwsFXirP7KHdN3ix96JXQE&usqp=CAY",
      ],
      description:
          "Os contrastes de cores e a mistura de materiais definem o Tênis Fila Attrek Masculino. Inspirado nos calçados dos anos 90, o cabedal é confeccionado em material sintético e Mesh que garante a ventilação interna. A palmilha Super Foam e a entressola em EVA asseguram conforto e amortecimento.",
    ),
    ProductModel(
      name: 'Tênis Fila Flagtrainer Masculino - Cinza',
      price: 249.99,
      images: [
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcQ0UJPdm6W9lL3Vhf64RwhtDQDM08YvYfRMxC-VhRViwqvHpaa9oTXErC5ROp8QNm32Ima66nvm33MmL_3TaIAryvz3vKSNmHf172HuF3o3YO_ItKG_xKHzYA&usqp=CAY",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcTkaQ4wf6h-yTEr5wn8glSuJsmFHrWU8wlR6J-cMpb96WUN3UOJ0N9oRgkylvBjdn72DzZ7CrXwzXj5qW9noh3ZyPTUb6-bKJ-xGgPGu3XWwMkjKf2TstWn_w&usqp=CAY",
        "https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcSv13ZK0IBKnsE9-Zx93_TLDNrnVOiFJl0gk4J19m9VUpNtQZDa9o0lGi3LSyhonUkfhmok2NqHC9rcURTxNA16vrxcEXybD_eLUwU2-ZuSTqvM0xsKrNKg&usqp=CAY",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTvJAZ5c_wfggD9KIOsXEBR7KucIOlKC24kPvD69K9-AYvxpfIrs358lmQ4wv_GwJZaS5EiAxQj8H1dzd0ab6gpy-hsQ5tnGXujZNwpxjx-e29RxNeUrj4UTg&usqp=CAY",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTvJAZ5c_wfggD9KIOsXEBR7KucIOlKC24kPvD69K9-AYvxpfIrs358lmQ4wv_GwJZaS5EiAxQj8H1dzd0ab6gpy-hsQ5tnGXujZNwpxjx-e29RxNeUrj4UTg&usqp=CAY",
      ],
      description:
          "O Tênis Fila Flagtrainer Masculino é perfeito para seu treino. Confeccionado com cabedal sintético têxtil, esse tênis leve conta com microfuros que aumentam a ventilação interna proporcionando uma sensação de frescor. Para maior conforto ele possui forro acolchoado no calcanhar que permite maior suporte aos pés, e palmilha Super Foam que garante ótimo amortecimento e maior absorção de impactos, possui também solado de EVA com detalhes emborrachados em locais estratégicos para melhor aderência e durabilidade.",
    ),
    ProductModel(
      name: 'Tênis Fila Radiate Masculino',
      price: 154.99,
      images: [
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRJ3TsfCYZLXnQAY3HPHbnGx3f3E-XV7kQ3MSTKxSvzXStz_dr9-1__4p3tVKB1G4eQqNbrhBymikOtDpNLsRSb7TtVmhtAZ4t8D3FqUgIdWjeMYunJF97UPmI&usqp=CAY",
        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSElY4cGhTd60SMnmhYy38S1dRBEKLn3mXE3aKtYWBZbLMKSpMaGvR2TDTTHOWxM44jSds3eXWNqH93m8H5EVvGcIR48s1s-PH6tedA8ojxgRg35QdbKBG2KA&usqp=CAY",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcSzt6Yd6C5equpQobjPywIpT4iXfqbM30r5gM95HlWzcCdqM9jwXCXJIwUZepKwTAzqvYfEqny7L2fDGM4sWgXP6-RSJzLOh7QzGDFQqOIj1Zvz0EldcS3buBo&usqp=CAY",
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRN3n43LggJaCaSVITrvQ_A5cg4mdnoYFpIriR41V6km2p219xBgxW260TVqQhLXRTbExi8A-HM1vsxjhOBlgh3FwcoPoqkzf8sb_YWj_F-2ImJfZ9NTUSCU2U&usqp=CAY",
      ],
      description:
          "Com design inspirado no retrô e clássico, o Tênis Fila Radiate conta com cabedal têxtil com aplicação em material sintético para estruturar mais o pé, dando estabilidade a cada passada. Aposte no tênis masculino para corrida, ótimo amortecimento transformando o impacto em energia a cada passada. O fechamento dinâmico traz mais conforto e liberdade de movimentos, se ajsutando ao seu pé. Conte com a Fila para te acompanhar nos treinos, complementando o seu look esportivo.",
    ),
    ProductModel(
      name: 'Tênis Fila F-Retro Sport Masculino',
      price: 159.90,
      images: [
        "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcRTZq-fa8WKfH9MC06tODtrXXS4tpUlI6NvnhCc1ARSlHinX-H-f5QNnSQAln-X3HiIF3LH75vtcueJjwS1nquJ6XFoXPS3Ul4Upawxm3U3jr8r7fu-hCbDCdA&usqp=CAY",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcS2BkSJmdEeytpfvzK4WpfYfTjZiyH32zWP2VjiB6k7ts-iCfF7nBppO9L5OGGyXx-ZO0m4LC_qDJs5SP7oUfZlS2sttY2E-voQd98MH_n6fVmb-iKFhvOD3qY&usqp=CAY",
        "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQP0WZcTYzCvCrkqCkhN3Btr05N08_p369LYCIWJ4rZQFThClrNPsj7KVi5BwYkE3heCYLhL7AJkZqTRmwtxRI7n0vcl1gUGCTtZWPO0n2AYnAYBRt092Z9N5Yc&usqp=CAY",
        "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSRWzP54Mf5GH6tN0UMv7NnPV6ajSPkndn-eI-Mz1AfdzFePt3ozk1fN7788xEwPVSFjNAA-hwqLiv4II_184U9INDvQS52w1sm3eMqUUJdDOxFd6mMd7NnKqA&usqp=CAY",
      ],
      description:
          "F-RETRO sport e um modelo classico do lifestyle italiano. Com um perfil de sola em EVA lixado, leva os stripes na lateral com as tradicionais cores da FILA. Composicao: Cabedal em nylon e couro. Palmilha plana em EVA com tecido. Sola e entressola em EVA lixado, e planta em borracha.",
    ),
  ];

  static Future<void> inserirProdutos() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    products.forEach((product) {
      firestore.collection("products").add(product.toMap());
    });
  }
}
