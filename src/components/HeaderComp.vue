<template>
	<div class="d-flex">
		<img class="me-auto" src="https://image.tmdb.org/t/p/w200/wwemzKWzjKYJFfCeiB57q3r4Bcm.png" alt="logo netflix" />
		<input
			placeholder="Cosa vuoi guardare?"
			class="me-5 form-control w-25"
			type="text"
			name="search"
			id="searchInput"
			v-model="searched"
			@keyup="$emit('updateSearch', searched)"
		/>
		<select
			@change="$emit('filterGenre', genreId)"
			v-model="genreId"
			aria-label=".form-select-lg example"
			class="form-select w-25 me-3"
			id="genreSelect"
			name="genreSelect"
		>
			<option value="" selected>Tutti i generi</option>
			<option :key="item.id" v-for="item in genre" :value="item.id">{{ item.name }}</option>
		</select>
	</div>
</template>
<script>
	export default {
		name: "HeaderComp",
		props: {
			genre: Array,
		},
		data() {
			return {
				searched: "",
				genreId: "",
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
			@media screen and (max-width: 400px) {
				display: none;
			}
		}
		@media screen and (max-width: 400px) {
			padding: 10px 5%;
		}
		input,
		select {
			@media screen and (max-width: 400px) {
				width: 50% !important;
				margin: 0 5px !important;
			}
		}
	}
</style>
