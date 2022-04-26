<template>
	<div class="card-info col-2">
		<img
			class="img-fluid"
			:src="`https://image.tmdb.org/t/p/w342/${image}`"
			alt=""
		/>
		<div>
			<h5 class="my-2">{{ title }}</h5>
			<div>
			<p>Language: {{ language }}</p>
			<p>Media Voto: {{ voteAverage }}</p>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	name: "ElementCard",
	props: {
		title: String,
		originalTitle: String,
		language: String,
		voteAverage: String,
		image: String,
	},
};
</script>
<style lang="scss" scoped>
div.card-info {
	width: calc(100% / 6 - 10px);
	margin-top: 10px;
	box-shadow: -1px -1px 10px 1px rgba($color: #fff, $alpha: 0.3);
	border-radius: 20px;
	background-color: #000;
	color: #fff;
	text-align: center;
	img {
		border-radius: 20px 20px 0 0;
	}
	p {
		margin: 0;
	}
	
}
div.card-info:last-child {
	margin-left: 10px;
	margin-right: auto;
}
</style>
