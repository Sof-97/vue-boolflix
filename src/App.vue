<template>
	<div id="app">
		<HeaderComp @updateSearch="updateSearch" @filterGenre="filterGenre" :genre="genre" />
		<main class="container-xl mt-3">
			<h2>{{ headingTop }}</h2>
			<MainComp :filmData="genreSearchMovie" />
			<h5 class="no-result" v-if="this.filmData.length == 0">Nessun risultato per film</h5>
			<h2 v-if="selected.text != ''" class="mt-4">Serie TV</h2>
			<ShowComp :showData="showData" />
			<h5 class="no-result" v-if="this.showData.length == 0 && this.selected.text != ''">
				Nessun risultato per serie tv
			</h5>
		</main>
	</div>
</template>

<script>
	import "flag-icons";
	import "bootstrap";
	import axios from "axios";
	import HeaderComp from "./components/HeaderComp.vue";
	import MainComp from "./components/MainComp.vue";
	import ShowComp from "./components/ShowComp.vue";
	export default {
		name: "App",
		components: {
			HeaderComp,
			MainComp,
			ShowComp,
		},
		data() {
			return {
				apiKey: "?api_key=45fcb174ff225f6bfb45caa448731eef",
				movieSearch: "https://api.themoviedb.org/3/search/movie/",
				showsSearch: "https://api.themoviedb.org/3/search/tv/",
				popular: "https://api.themoviedb.org/3/trending/movie/day?api_key=45fcb174ff225f6bfb45caa448731eef",
				selected: {
					lang: "it-IT",
					text: "",
					genre: "",
				},
				genre: null,
				filmData: [],
				showData: [],
				toGet: "",
				data: null,
				headingTop: null,
			};
		},
		created() {
			this.getPopular();
			this.getGenreList();
		},
		methods: {
			updateSearch(search) {
				this.selected.text = search;
			},
			filterGenre(genre) {
				this.selected.genre = genre;
			},
			getPopular() {
				this.headingTop = "Popolari questa settimana";
				axios.get(this.popular).then(res => {
					this.filmData = res.data.results;
				});
			},
			getFilmData() {
				axios
					.get(
						this.movieSearch + this.apiKey + "&query=" + this.selected.text + "&append_to_response=credits"
					)
					.then(res => {
						this.filmData = res.data.results;
					});
			},
			getShowData() {
				axios.get(this.showsSearch + this.apiKey + "&query=" + this.selected.text).then(res => {
					this.showData = res.data.results;
				});
			},
			// Richiesta dati generi
			getGenreList() {
				axios
					.get("https://api.themoviedb.org/3/genre/movie/list?api_key=45fcb174ff225f6bfb45caa448731eef")
					.then(res => {
						this.genre = res.data.genres;
					});
				axios
					.get("https://api.themoviedb.org/3/genre/tv/list?api_key=45fcb174ff225f6bfb45caa448731eef")
					.then(res => {
						let data = res.data.genres;
						data.forEach(element => {
							let test = this.genre.filter(g => g.id == element.id);
							if (test.length == 0) {
								this.genre.push(element);
							}
						});
					});
			},
		},
		// CONTROLLO PAGINA INIZIALE O RICERCA EFFETTUTA
		watch: {
			"selected.text": function () {
				if (this.selected.text == "") {
					this.headingTop = "I titoli del momento";
					this.getPopular();
				} else {
					this.headingTop = "Film";
					this.getFilmData();
					this.getShowData();
				}
			},
		},
		// CONTROLLO FILTRO PER GENERE
		computed: {
			genreSearchMovie: function () {
				if (this.selected.genre != "") {
					return this.filmData.filter(film => film.genre_ids.includes(this.selected.genre));
				} else {
					return this.filmData;
				}
			},
			genreSearchShow: function () {
				if (this.selected.genre != "") {
					return this.showData.filter(show => show.genre_ids.includes(this.selected.genre));
				} else {
					return this.showData;
				}
			},
		},
	};
</script>

<style lang="scss">
	@import "bootstrap/dist/css/bootstrap.min.css";
	div#app {
		background: linear-gradient(#000, #6e0d14);
		min-height: 100vh;
		main {
			padding-bottom: 60px;
			h2 {
				padding-left: 5%;
				color: #fff;
				font-weight: bold;
			}
		}
		.no-result {
			color: #fff;
			opacity: 0, 8;
			margin: 10px 100px;
		}
	}
</style>
