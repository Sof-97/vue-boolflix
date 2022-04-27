<template>
	<div class="d-flex">
		<img
			class="me-auto"
			src="https://image.tmdb.org/t/p/w200/wwemzKWzjKYJFfCeiB57q3r4Bcm.png"
			alt="logo netflix"
		/>
		<input
			placeholder="Cosa vuoi guardare?"
			class="me-5 form-control w-25"
			type="text"
			name="search"
			id="searchInput"
			v-model="searched"
			@keyup="$emit('updateSearch', searched)"
		/>
		
		<select class="form-select w-25 me-3" name="genreSelect" id="genreSelect">
			<option value="">Oppure scegli un genere!</option>
			<option :key="item.id" v-for="item in filmGenre" value="item.id">Film: {{item.name}}</option>
			<option :key="item.id + 'show'" v-for="item in showGenre" value="item.id">Serie TV: {{item.name}}</option>
		</select>
	</div>
</template>
<script>
export default {	
	name: "HeaderComp",
	props:{
		showGenre: Array,
		filmGenre: Array
	},
	data() {
		return {
			searched: "",
		};
	},
};
</script>
<style lang="scss" scoped>
div {
	background-color: #000;
	padding: 15px 0;
	img {
		margin-left: 100px;
	}
}
</style>
