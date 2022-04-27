<template>
	<div id="app">
		<HeaderComp @updateSearch="updateSearch" :filmGenre="filmGenre" :showGenre="showGenre"/>
		<main class="container mt-3">
			<h2>{{ headingTop}}</h2>
			<MainComp :filmData="filmData" />
			<h5 class="no-result" v-if="this.filmData.length == 0">Nessun risultato per film</h5>
			<h2 v-if="selected.text != '' " class="mt-4">Serie TV</h2>
			<ShowComp :showData="showData"/>
			<h5 class="no-result" v-if="this.showData.length == 0 && this.selected.text != ''">Nessun risultato per serie tv</h5>
		</main>
	</div>
</template>

<script>
import "flag-icons"
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
		ShowComp
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
			},
			showGenre: null,
			filmGenre: null,
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
		// NOTE VECCHIO METODO, RICHIESTE CONTINUE ALL'API
		// getData() {
		// 		this.toGet =
		// 			this.movieSearch +
		// 			this.apiKey +
		// 			"&language" +
		// 			this.selected.lang +
		// 			"&query=" +
		// 			this.selected.text;
		// 	axios.get(this.toGet).then(res => {
		// 		console.log(res);
		// 		this.data = res.data.results;
		// 	});
		// 	console.log(this.data);
		// 	return this.data;
		// },
		getPopular(){
			this.headingTop = "Popolari questa settimana"
			axios.get(this.popular)
				.then(res => {
					this.filmData = res.data.results
				})
		},
		getFilmData(){
			axios.get(this.movieSearch + this.apiKey + "&query=" + this.selected.text)
				.then(res => {
					this.filmData = res.data.results
				})
		},
		getShowData(){
			axios.get(this.showsSearch + this.apiKey + "&query=" +this.selected.text)
				.then(res => {
					this.showData = res.data.results
				})
		},
		getGenreList(){
			axios.get("https://api.themoviedb.org/3/genre/movie/list?api_key=45fcb174ff225f6bfb45caa448731eef")
				.then(res => {
					console.log(res);
					this.filmGenre = res.data.genres
				})
			axios.get("https://api.themoviedb.org/3/genre/tv/list?api_key=45fcb174ff225f6bfb45caa448731eef")
			.then(res => {
					console.log(res);
					this.showGenre = res.data.genres
				})
			}
	},
	watch:{
		'selected.text': function(){
			if(this.selected.text == ''){
			this.headingTop = "I titoli del momento"
				this.getPopular()
			} else{
				this.headingTop = "Film"
				this.getFilmData()
				this.getShowData()
			}
}
	}
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
	.no-result{
		color: #fff;
		opacity: 0,8;
		margin: 10px 100px;
	}
}
</style>
