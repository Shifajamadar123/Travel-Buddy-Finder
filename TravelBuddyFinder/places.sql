-- beaches
insert into places (name,tag,country,image_name,image_data) values("Dune du Pyla","beaches","france","image0.png",LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image0.png'));
insert into places (name,tag,country,image_name,image_data) values("Shoal Bay","beaches","Antigua","image1.png",LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image1.png'));
insert into places (name,tag,country,image_name,image_data,info,link) values("Fakistra","beaches","Greece","image2.png",LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image2.png'),"More of a cove than a beach, backed by cliffs and dense woods, with white sands and pebbles and clear blue waters – is Fakistra on the Pelion peninsula (mainland Greece), below Tsagarada village.","https://www.greeka.com/thessaly/pelion/beaches/fakistra/");
insert into places (name,tag,country,image_name,image_data,info,link) values("Baga Beach","beaches","India","image3.png",LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image3.png'),"Ravishing from sunrise to sunset, Baga Beach in Goa is amongst the most vibrant beaches of India. Loaded with some of the area's most fantastic nightclubs, the nightlife at Baga beach makes it more interesting.","https://en.wikipedia.org/wiki/Baga,_Goa");

UPDATE places SET info = "This beach is Europe’s tallest dune at over 100 metres. It’s an hour’s drive from Bordeaux and is literally dazzling.", link = "https://en.wikipedia.org/wiki/Dune_of_Pilat" WHERE id = 1;
UPDATE places SET info = "Icing-sugar sand, 3km of it, crystal-clear Caribbean water, off-shore coral reef with spectacular snorkelling or diving, a smattering of bars and open-air restaurants ... job done!", link = "https://www.booking.com/hotel/ai/shoal-bay-villas.en-gb.html" WHERE id = 2;


-- mountains
insert into places (name,tag,country,image_name,image_data,info,link) values("The Himalaya Range","mountains","India","image4.png",LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image4.png'),"The highest mountain range of India, Himalaya literally translates to abode of snow from Sanskrit.
The Himalayan Mountain is the youngest range of India and is a new fold mountain formed by the collision of two tectonic plates. The Himalayan Mountain Range has almost every highest peak of the world and on an average they have more than 100 peaks with height more than 7200m","https://en.wikipedia.org/wiki/Himalayas");
insert into places (name,tag,country,image_name,image_data,info,link) values("The Aravalli Range","mountains","India","image5.png",LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image5.png'),"The oldest mountain range of India, The Aravalli Range is also the oldest mountain range in the world. Width of range varies from 10km to 100km. In local language, Aravalli translates to 'line of peaks', and spans a total length of 800 km, covering the Indian states of Delhi, Haryana, Rajasthan and Gujrat. Aravalli Range plays a very important role in Indian climate as it block wind carrying rain to reach Thar Desert.","https://en.wikipedia.org/wiki/Aravalli_Range");

-- religious
INSERT INTO Places (name, tag, country, image_name, image_data, info, link)
VALUES (
    "Golden Temple",
    "religious",
    "India",
    "image6.png",
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image6.png'),
    "The Golden Temple, also known as Harmandir Sahib, is a prominent religious and cultural landmark located in Amritsar, Punjab. It is the holiest shrine of Sikhism. The temple is famous for its stunning architecture and the sacred pool, which surrounds the main building.",
    "https://en.wikipedia.org/wiki/Golden_Temple"
);

INSERT INTO Places (name, tag, country, image_name, image_data, info, link)
VALUES (
    "Varanasi (Benares)",
    "religious",
    "India",
    "image7.png",
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image7.png'),
    "Varanasi, also known as Benares, is one of the oldest continuously inhabited cities in the world and is considered the spiritual capital of India. It is a major religious hub for Hindus and is known for its ghats along the Ganges River, where rituals and ceremonies take place.",
    "https://en.wikipedia.org/wiki/Varanasi"
);

-- hiking

INSERT INTO Places (name, tag, country, image_name, image_data, info, link)
VALUES (
    "Himalayan Mountains",
    "hiking",
    "India",
    "image8.png",
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image8.png'),
    "The Himalayan mountain range, located in northern India, offers some of the most breathtaking and challenging hiking opportunities. It's famous for its diverse landscapes, pristine beauty, and a wide range of hiking trails suitable for all levels of hikers.",
    "https://en.wikipedia.org/wiki/Himalayas"
);

INSERT INTO Places (name, tag, country, image_name, image_data, info, link)
VALUES (
    "Western Ghats",
    "hiking",
    "India",
    "image9.png",
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image9.png'),
    "The Western Ghats, also known as the Sahyadri Mountains, provide excellent hiking opportunities in the southern and western regions of India. These lush and biodiverse mountains offer numerous trails, waterfalls, and unique flora and fauna.",
    "https://en.wikipedia.org/wiki/Western_Ghats"
);

-- heritage

INSERT INTO Places (name, tag, country, image_name, image_data, info, link)
VALUES (
    "Taj Mahal",
    "heritage",
    "India",
    "image10.png",
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image10.png'),
    "The Taj Mahal is an iconic white marble mausoleum located in Agra, Uttar Pradesh. It is a UNESCO World Heritage Site and is considered one of the most beautiful buildings in the world. The Taj Mahal was built by the Mughal emperor Shah Jahan in memory of his beloved wife Mumtaz Mahal.",
    "https://en.wikipedia.org/wiki/Taj_Mahal"
);

INSERT INTO Places (name, tag, country, image_name, image_data, info, link)
VALUES (
    "Qutub Minar",
    "heritage",
    "India",
    "image11.png",
    LOAD_FILE('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\image11.png'),
    "Qutub Minar, located in Delhi, is a UNESCO World Heritage Site and is one of the tallest minarets in the world. It is a historical monument built by Qutb-ud-din Aibak, the founder of the Delhi Sultanate, and is known for its intricate architecture.",
    "https://en.wikipedia.org/wiki/Qutb_Minar"
);





