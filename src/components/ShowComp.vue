<template>
	<div class="row row-cols-auto justify-content-between  g-0">
		<ElementCard
			:key="item.id"
			v-for="item in showData"
			:title="item.name"
			:originalTitle="item.original_name"
			:language="item.original_language"
			:voteAverage="String(item.vote_average)"
			:image="item.poster_path"
		/>
	</div>
</template>

<script>
import ElementCard from "./ElementCard.vue";
export default {
	name: "ShowComp",
	components: {
		ElementCard,
	},
	props: {
		showData: Array,
	},
};
</script>
