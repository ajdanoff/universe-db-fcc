# freeCodeCamp Relational Database: Celestial Bodies Database

Completed PostgreSQL project for [freeCodeCamp certification](https://www.freecodecamp.org/learn/relational-databases/).[web:8]

## Features
- 5 tables: galaxy, star, planet, moon, constellation
- Foreign keys, sequences, sample data (solar system + Milky Way stars)
- Verified tests pass (list queries here)

## Setup
```bash
psql -U freecodecamp universe < universe.sql
```

## Queries Demo
```sql
-- Example: Moons of gas giants
SELECT p.name, COUNT(m.moon_id) FROM planet p
JOIN moon m ON p.planet_id = m.planet_id
WHERE p.planet_type = 'Gas Giant'
GROUP BY p.name;
```

![Schema](schema.png) <!-- Optional: Generate ERD with dbdiagram.io -->
