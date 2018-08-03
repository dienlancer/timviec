@extends("frontend.master")
@section("content")
<!-- map Wrapper Start -->
	<div class="jp_map_indx_wrapper">
		<div id="map"></div>
		<div class="jp_slider_form_main_wrapper">
            <div class="jp_main_slider_heading_wrapper">
                <h2>Find Your Job!</h2>
            </div>
            <div class="jp_slider_form_input">
                <input type="text" placeholder="Keyword e.g. (Job Title, Description, Tags)">
            </div>
            <div class="jp_slider_form_location_wrapper">
                <i class="fa fa-dot-circle-o first_icon"></i><select>
						<option>Select Location</option>
						<option>Select Location</option>
						<option>Select Location</option>
						<option>Select Location</option>
						<option>Select Location</option>
					</select><i class="fa fa-angle-down second_icon"></i>
            </div>
            <div class="jp_slider_form_location_wrapper">
                <i class="fa fa-th-large first_icon"></i><select>
						<option>Category</option>
						<option>Category</option>
						<option>Category</option>
						<option>Category</option>
						<option>Category</option>
					</select><i class="fa fa-angle-down second_icon"></i>
            </div>
            <div class="jp_slider_form_location_wrapper">
                <i class="fa fa-line-chart first_icon"></i><select>
						<option>Experience</option>
						<option>Experience</option>
						<option>Experience</option>
						<option>Experience</option>
						<option>Experience</option>
					</select><i class="fa fa-angle-down second_icon"></i>
            </div>
            <div class="jp_slider_form_location_wrapper">
                <i class="fa fa-money first_icon"></i><select>
						<option>salary</option>
						<option>salary</option>
						<option>salary</option>
						<option>salary</option>
						<option>salary</option>
					</select><i class="fa fa-angle-down second_icon"></i>
            </div>
            <div class="jp_slider_form_btn_wrapper">
                <ul>
                    <li><a href="#"><i class="fa fa-search"></i>&nbsp; SEARCH</a></li>
                </ul>
            </div>
        </div>
	</div>
    <!-- map Wrapper End -->
@endsection()               