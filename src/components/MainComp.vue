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
		>
		</element-card>
	</div>
</template>
<script>
	import ElementCard from "./ElementCard.vue";
	export default {
		name: "MainComp",
		components: {
			ElementCard,
		},
		props: {
			filmData: Array,
		},
	};
</script>
<style lang="scss" scoped></style>
