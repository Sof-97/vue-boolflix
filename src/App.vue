<template>
	<div id="app">
		<HeaderComp @getData="getData" @updateSearch="updateSearch" />
		<main class="container mt-3">
			<MainComp :filmData="getData()" />
		</main>
	</div>
</template>

<script>
import "bootstrap";
import axios from "axios";
import HeaderComp from "./components/HeaderComp.vue";
import MainComp from "./components/MainComp.vue";
export default {
	name: "App",
	components: {
		HeaderComp,
		MainComp,
	},
	data() {
		return {
			apiKey: "?api_key=45fcb174ff225f6bfb45caa448731eef",
			movieSearch: "https://api.themoviedb.org/3/search/movie/",
			showsSearch: "https://api.themoviedb.org/3/search/tv/",
			selected: {
				lang: "it-IT",
				text: "",
			},
			toGet: "",
			data: null,
		};
	},
	//created() {
	//	this.getData();
	//},
	methods: {
		updateSearch(search) {
			this.selected.text = search;
		},
		getData() {
			if (this.selected.text == "") {
				this.toGet =
					"https://api.themoviedb.org/3/movie/popular?api_key=45fcb174ff225f6bfb45caa448731eef&language=en-US&page=1";
				// this.toGet = this.movieSearch + "popular" + this.apiKey + "&language=" + this.selected.lang
			} else {
				this.toGet =
					this.movieSearch +
					this.apiKey +
					"&language" +
					this.selected.lang +
					"&query=" +
					this.selected.text;
			}
			axios.get(this.toGet).then(res => {
				console.log(res);
				this.data = res.data.results;
			});
			console.log(this.data);
			return this.data;
		},
	},
};
</script>

<style lang="scss">
@import "bootstrap/dist/css/bootstrap.min.css";
div#app {
	background: linear-gradient(#000, #6e0d14);
}
</style>
