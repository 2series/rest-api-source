# Load Data from REST APIs

We load data from REST APIs using dlt and DuckDB. Specifically focuses on the Pokemon and Github APIs and aims to provide a practical understanding of API data extraction with dlt and DuckDB for data storage.

Approach:
1. Summarize the core objective of the tutorial.
2. Detail the essential steps outlined for setting up and executing the pipeline.
3. Highlight crucial aspects of configuring the REST API source.
4. Emphasize data handling aspects like appending, replacing, and merging data.

Plan:
1. Provide an overview of using dlt for REST API data loading.
2. Summarize the setup instructions and installation steps.
3. Explain the configurations of the REST API source (client, resource_defaults, and resources).
4. Detail the methods for handling data (append, replace, merge).

CoT:
1. Guide on using dlt to extract data from REST APIs and load it into a database.
2. Project setup involves initializing a new dlt project and installing dependencies.
3. Source configuration is key in specifying the base URL, endpoint parameters, and resources to load.
4. Users can control data loading into the destination via write dispositions, impacting data consistency.

Breakdown of setting up a project and understanding the file structure:
    
1. Use `dlt init rest_api duckdb` to create a new project for REST APIs.
2. Examine the file structure which includes `rest_api_pipeline.py`, `requirements.txt`, and a `.dlt/` directory.
3. Note `rest_api_pipeline.py` as where main scripts go, `requirements.txt` for dependencies and `.dlt/` directory that stores configuration files such as `config.toml` and `secrets.toml`. 

CoT for configuration of REST API Source:

1. Client: The `client` configuration is critical in setting the base URL for the target API. This includes `client["base_url"]` which is necessary for targeting a particular API.
2. Resource Defaults: Set defaults such as endpoint parameters (`limit`) for efficient data retrieval and other settings in `resource_defaults["endpoint"]["params"]` etc..
3. Resources: `resources` define a list of resources such as "pokemon", "berry", "location", ensuring the specified resources are loaded to the destination such as DuckDB.
4. Write Disposition: By default write_disposition is `append`, we can modify it to `replace` for replacing data each time pipeline runs and `merge` to merge the data based on a specified primary key for more dynamic data updating processes in the destinations storage.

## Summary
We demonstrates loading data from REST APIs using dlt and DuckDB. It begins by setting up a new dlt project via the command `dlt init rest_api duckdb`, followed by the installation of necessary dependencies through `pip install -r requirements.txt`. The project structure includes Python scripts for the data pipeline, requirements, and configuration files for secrets and project settings in a `.dlt/` directory.

The REST API source is configured by setting a base URL and default parameters for endpoints in the `client` and `resource_defaults` sections, respectively. Specific resources like "pokemon", "berry", and "location" are then listed for extraction. The data can be appended by default, replaced with the `replace` write disposition to avoid duplicates, or merged using `merge` for data updates, which requires a specified primary key. 

Executing the pipeline involves running `python rest_api_pipeline.py` and the data's integrity can be viewed through dlt's interactive browser interface initiated with `dlt pipeline rest_api_pokemon show` after installing Streamlit.

## About dataset

This dataset contains information about Pokemon and their various forms from the PokeAPI (https://pokeapi.co/). The dataset includes:

### Data Overview
- 1,301 Pokemon entries including base forms and variants
- Each entry contains: name, API URL, and loading metadata
- Coverage spans from Generation 1 to modern Pokemon games

### Notable Features
1. **Base Pokemon**: Original Pokemon forms from all generations
2. **Regional Variants**: 
   - Alolan forms (Gen 7)
   - Galarian forms (Gen 8)
   - Hisuian forms (Legends: Arceus)
   - Paldean forms (Gen 9)

3. **Special Forms**:
   - Gigantamax (Gmax) forms
   - Mega Evolutions
   - Alternative forms (e.g., Deoxys forms, Rotom forms)
   - Gender variations
   - Regional boss variants (e.g., Totem Pokemon)

### Data Structure
- `name`: Pokemon name with form identifier (if applicable)
- `url`: Direct link to the Pokemon's data in PokeAPI
- `_dlt_load_id`: Loading timestamp
- `_dlt_id`: Unique identifier

### Common Variant Types
- Base forms (e.g., "pikachu")
- Regional variants (e.g., "meowth-galar")
- Battle forms (e.g., "charizard-gmax")
- Special forms (e.g., "urshifu-rapid-strike")
- Cosmetic variants (e.g., "alcremie-gmax")

This dataset is valuable for:
- Analyzing Pokemon diversity across generations
- Studying regional variant distribution
- Tracking special form implementations
- Understanding Pokemon naming conventions