class ArtifactsInfo {
  final int artindex;
  final int position;
  final int position2;
  final int position3;
  final String name1;
  final String Name;
  final String namee;
  final String iconImage1;
  final String description1;
  final String description2;
  final String description3;
  final String name2;
  final String name3;
  final String iconImage;
  final String iconImage2;
  final String iconImage3;
  final List<String> images1;
  final List<String> images2;
  final List<String> images3;

  ArtifactsInfo(
    this.artindex,
    this.position,
    this.position2,
    this.position3, {
    this.name1,
    this.Name,
    this.namee,
    this.iconImage,
    this.iconImage1,
    this.description1,
    this.description2,
    this.description3,
    this.images1,
    this.images2,
    this.images3,
    this.name2,
    this.iconImage2,
    this.name3,
    this.iconImage3,
  });

  // String get name2 => null;
}

List<ArtifactsInfo> planets = [
  ArtifactsInfo(
    1,
    1, 2, 3,
    Name: 'Music',
    name1: 'Ancient Flute',
    namee: 'Chapter 2.1',
    iconImage: 'assets/Instruments.png',
    iconImage1: 'assets/Flute.png',
    // iconImage2:'d.png',
    description1:
        '''Bansuri is a very sensitive instrument; almost all the delicate graces, curves, embellishments and shades of classical music can be performed to perfection upon it. The highest order of music can be played on this instrument, and its resonance in mandra saptak (lower octave) leaves a rare charm in the minds of its listeners. Being a portable instrument, it can be carried easily from place to place and climatic changes have very little or no effect on the seasoned bamboo. ''',
    //images1: ['assets/Flute.png'],
    name2: 'Sitar',
    iconImage2: 'assets/Sitar.png',
    // iconImage2:'d.png',
    description2: '''
The history of the sitar is full of inspiration and intrigue. Is a stringed instrument with its origins in ancient India. The word "sitar" comes from the Persian language and it means three strings. It was traditionally used by professional musicians to accompany singing or dancing. It was first introduced to Western audiences by Pandit Ravi Shankar, who became famous for his collaboration with the Beatles- George Harrison. The sitar has become an iconic symbol of Indian culture all over the world, having influenced both Eastern and Western music
The beautiful resonance of the sitar comes from its sympathetic strings and long hollow neck. The versatile instrument is made out of a gourd body, allowing it to be adapted in different genres including Indo-Western fusion music and Indian film soundtracks.
''',
    //images2: ['assets/Sitar.png'],

    name3: 'Tabla Drums',
    iconImage3: 'assets/TablaDrums.png',
    // iconImage2:'d.png',
    description3:
        '''        A tabla is a pair of twin hand drums from the Indian subcontinent. Since the 18th century, it has been the principal percussion instrument in Hindustani classical music, where it may be played solo, as accompaniment with other instruments and vocals, and as a part of larger ensembles. It is frequently played in popular and folk music performances in India, Bangladesh, Pakistan, Nepal and Sri Lanka. The tabla is an essential instrument in the bhakti devotional traditions of Hinduism and Sikhism, such as during bhajan and kirtan singing. It is one of the main qawali instrument used by Sufi musicians. The instrument is also featured in dance performances such as Kathak.
The Indian theory traces the origin of tabla to indigenous ancient civilization. The stone sculpture carvings in Bhaja Caves depict a woman playing a pair of drums, which some have claimed as evidence for the ancient origin of the tabla in India. 

''',
    images1: [],
  ),
  ArtifactsInfo(2, 1, 2, 3,
      Name: 'Paintings',
      iconImage: 'assets/Paintings.png',
      namee: 'Chapter 2.2',
      name1: "Ajanta Cave Painting",
      iconImage1: 'assets/CavePainting.png',
      description1:
          '''Ajanta is the only surviving example of painting of the first century BCE and the fifth century CE .The subject matter of these paintings is almost exclusively Buddhist, excepting decorative patterns on the ceilings and the pillars.They are mostly associated with the Jataka, collection of stories, recording the previous births of the Lord Buddha.

''',
      name2: "Ravi Varma Paintings-Shakuntala",
      iconImage2: 'assets/RaviVarma.png',
      description2: '''
This whimsical oil on canvas piece, titled “Shakuntala – Looks of Love”, is by the Malayali Indian artist, Raja Ravi Varma, from 1870. It depicts Shakuntala, a character from the ‘Mahabaratha’, one of the two major Sanskrit epic stories from India. She is the mother of Emperor Bharata who founded the Bhārata dynasty.
In this piece, Varma painted Shakuntala as she pretends to remove a thorn from her foot. Secretly, Shakuntala is looking for her lover, Dushyantha.“Shakuntala – Looks of Love” is currently on display at the Sri Chitra Art GallerSri Chitra Art Gallery in Trivandrum, Kerala, India along with many other of his works.
''',
      name3: "Ravi Varma Paintings-Shakuntala",
      iconImage3: 'assets/RaviVarma.png',
      description3: '''
This whimsical oil on canvas piece, titled “Shakuntala – Looks of Love”, is by the Malayali Indian artist, Raja Ravi Varma, from 1870. It depicts Shakuntala, a character from the ‘Mahabaratha’, one of the two major Sanskrit epic stories from India. She is the mother of Emperor Bharata who founded the Bhārata dynasty.
In this piece, Varma painted Shakuntala as she pretends to remove a thorn from her foot. Secretly, Shakuntala is looking for her lover, Dushyantha.“Shakuntala – Looks of Love” is currently on display at the Sri Chitra Art GallerSri Chitra Art Gallery in Trivandrum, Kerala, India along with many other of his works.
''',
      images1: []),
  ArtifactsInfo(3, 1, 2, 3,
      Name: 'Sculpture',
      iconImage: 'assets/Sculpture.png',
      namee: 'Chapter 2.3',
      name1: 'Standing Parvathi',
      iconImage1: 'assets/parvathi.png',
      description1:
          '''Chola period (ca. 860â€“1279), ca. first quarter of 10th century
Here, Parvati is identified by her conical crown with mountainlike (karandamukuta) tiers. She stands in a triple-bend (tribhanga) pose with a pronounced sway and holds one arm and hand down in a dramatic fashion. The other hand is posed in a manner that represents holding a flower. Images of Parvati in this position often accompany Shiva in his role as Lord of Dance (Nataraja), suggesting that this sculpture once may have been placed to the left of an image of the god. She wears luxurious jewellery and a diaphanous skirt secured with a heavy belt, both of which emphasize her sensual volumes. The total effect is perfection, an ideal combination of realistic details and abstract forms.



''',
      name2: 'Natraja',
      iconImage2: 'assets/Natraja.png',
      description2:
          '''Nataraja, (Sanskrit: “Lord of the Dance”) the Hindu god Shiva in his form as the cosmic dancer, represented in metal or stone in many Shaivite temples, particularly in South India.
In the Nataraja sculpture, Shiva is shown as the source of all movement within the cosmos and as the god whose doomsday dance, represented by the arch of flames, accompanies the dissolution of the universe at the end of an eon. His dance of creation is said to have been performed in Chidambaram (an important Shaiva centre in South India), a place that is identified with both the centre of the universe and the human heart. The gestures of the dance represent Shiva’s five activities (panchakritya): creation (symbolized by the drum), protection (by the “fear-not” pose of the hand), destruction (by the fire), embodiment (by the foot planted on the ground), and release (by the foot held aloft).
''',
      name3: 'The Budhha',
      iconImage3: 'assets/Statue.png',
      description3:
          '''The Great Buddha statue is one of the popular stops on the Buddhist pilgrimage and tourist routes in Bodh Gaya, Bihar (India). The statue is 19.5 m (64 ft) high representing the Buddha seated in a meditation pose, or dhyana mudra, on a lotus in the open air.The statue was designed by V. Ganapati Sthapati and took seven years to complete using the labor of 12,000 stonemasons. It is constructed from a combination of sandstone and red granite blocks. A hollow spiral staircase inside the statue leads from the ground up to the chest. The Great Buddha statue is located in a garden at the end of Temple Street and is surrounded by smaller sculptures of Buddha's ten principal disciples, five on each side. The foundation stone for the statue was laid in 1982. ''',
      images1: []),
  ArtifactsInfo(4, 1, 2, 3,
      Name: '''Ancient Remains''',
      iconImage: 'assets/Pot.png',
      namee: 'Chapter 2.4',
      name1: 'Harappa',
      iconImage1: 'assets/Cart.png',
      description1:
          '''The most important [ancient Indus] crafts were in the fields of textiles, ceramic manufacturing, stone carving, household artefacts such as razors, bowls, cups, vases and spindles, and the production of jewellery, statuettes, figurines and children's toys, some of which were mechanical in function. 
The most unusual cart-frame was the type illustrated. It was strongly made of pottery with four vertically pierced holes on each side to take stakes of wood, exactly as in the little farm carts used in the present day in Middle and Upper Sindh. The four holes in the middle took longer stakes projecting from the underside of the frame in pairs, between which the easily removable axle of the wheels was held. There were also horizontal holes for the shaft through one end of the frame and the middle cross-piece. 
''',
      name2: 'Mortar & Pestle',
      iconImage2: 'assets/Mortar.png',
      description2:
          '''Mortars and pestles have been used in cooking since prehistory; today they are typically associated with the profession of pharmacy due to their historical use in preparing medicines. 
The invention of mortars and pestles seems related to that of quern-stones, which use a similar principle of naturally indented, durable, hard stone bases and mallets of stone or wood to process food and plant materials, clay, or minerals by stamping, crushing, pulverizing and grinding.
''',
      name3: 'Pot',
      iconImage3: 'assets/Pottery.png',
      description3:
          '''The Indian subcontinent has an ancient history and is one of the most tangible and iconic elements of Indian art. Evidence of pottery has been found in the early settlements of Lahuradewa and later the Indus Valley civilization. Today, it is a cultural art that is still practiced extensively in Indian subcontinent. Until recent times all Indian pottery has been earthenware, including terracotta.
Today, pottery thrives as an art form in India. Various platforms, including potters' markets and online pottery boutiques have contributed to this trend.


''',
      images1: []),
];
