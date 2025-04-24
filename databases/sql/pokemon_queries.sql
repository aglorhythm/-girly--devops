/* Requête 1: Compter le nombre de Pokémon par type dans l'ordre décroissant. */ 

SELECT Types.name_type, COUNT(*) FROM Pokemon 
LEFT OUTER JOIN PokemonType ON Pokemon.pokedex_number = PokemonType.pokedex_number 
LEFT OUTER JOIN Types ON  PokemonType.type_id = Types.type_id
GROUP BY Types.name_type
ORDER BY COUNT(*) DESC;

/* Requête 2: Lister les Pokémon avec un nombre de base de points supérieur à 600, triés de manière décroissante. */ 
SELECT name, base_total FROM Pokemon
WHERE base_total > 600
ORDER BY base_total DESC;

/* Requête 3: Afficher les types de Pokémon avec la base de points moyenne dans l'ordre croissant */
SELECT Types.name_type AS type, AVG(Pokemon.base_total) AS average_base_total FROM Pokemon 
LEFT OUTER JOIN PokemonType ON Pokemon.pokedex_number = PokemonType.pokedex_number 
LEFT OUTER JOIN Types ON  PokemonType.type_id = Types.type_id
GROUP BY Types.name_type
ORDER BY average_base_total ASC;

/* Requête 4: Trouver les Pokémon qui ont la capacité spéciale 'Overgrow' et trier par la base de points dans un ordre décroissant */
SELECT Pokemon.name, Pokemon.base_total, Abilities.name_ability FROM Pokemon 
LEFT OUTER JOIN PokemonAbility ON Pokemon.pokedex_number = PokemonAbility.pokedex_number 
LEFT OUTER JOIN Abilities ON PokemonAbility.ability_id = Abilities.ability_id
WHERE name_ability = 'Overgrow' 
ORDER BY base_total DESC;

/*Requête 5: Lister les noms des Pokémon, leur type principal et leur type secondaire (s'ils en ont un). Trier par le nom.*/
SELECT Pokemon.name, Types.name_type FROM Pokemon 
LEFT OUTER JOIN PokemonType ON Pokemon.pokedex_number = PokemonType.pokedex_number 
LEFT OUTER JOIN Types ON  PokemonType.type_id = Types.type_id
ORDER BY Pokemon.name;


/* Requête 6: Afficher les Pokémon avec un total de stats supérieur à la moyenne par génération. */
/* ?? */

/* Requête 7: Trouver les Pokémon de type "fire" avec une attaque supérieure à 100. */
SELECT Pokemon.name, Types.name_type, Stats.attack AS type FROM Pokemon 
LEFT OUTER JOIN PokemonType ON Pokemon.pokedex_number = PokemonType.pokedex_number 
LEFT OUTER JOIN Types ON  PokemonType.type_id = Types.type_id
LEFT OUTER JOIN Stats ON  Pokemon.pokedex_number = Stats.pokedex_number
WHERE Types.name_type = 'fire' AND Stats.attack > 100;

/*Requête 8: Indiquer si le total des stats d'un Pokémon est supérieur ou inférieur à la moyenne par génération.*/
/* ??