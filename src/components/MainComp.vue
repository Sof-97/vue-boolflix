<template>
	<div class="row row-cols-auto justify-content-between g-0">
		<element-card
			:key="item.id"
			v-for="item in filmData"
			:title="item.title"
			:originalTitle="item.original_title"
			:language="item.original_language"
			:voteAverage="String(item.vote_average)"
			:image="item.poster_path"
			:overview="item.overview"
			:id="item.id"
			:genre="(getGenre(item.id))"
		>
		</element-card>
	</div>
</template>
<script>
import axios from "axios";
import ElementCard from "./ElementCard.vue";
export default {
	name: "MainComp",
	components: {
		ElementCard,
	},
	props: {
		filmData: Array,
	},
	methods: {
		getGenre(a) {
			let b;
			axios
				.get(
					"https://api.themoviedb.org/3/movie/" +
						a +
						"?api_key=45fcb174ff225f6bfb45caa448731eef"
				)
				.then(res => {
					b = res.data.genres;
					console.log(b);
				});
			return b;
		},
	},
};
</script>
<style lang="scss" scoped></style>
