/*
 * Smooth Spoiler Animation
 * Handles smooth expansion and collapse of <details> elements with class "spoiler"
 */

document.addEventListener('DOMContentLoaded', function () {
    const spoilers = document.querySelectorAll('details.spoiler');

    spoilers.forEach(function (spoiler) {
        const summary = spoiler.querySelector('summary');
        const content = spoiler.querySelector('.spoiler-content');
        const footer = spoiler.querySelector('.spoiler-close-footer');

        // Helper to calculate full height including content and footer
        function getFullHeight() {
            let height = summary.offsetHeight;
            if (content) height += content.offsetHeight;
            if (footer) height += footer.offsetHeight;
            // Add a small buffer for borders/margins if needed, or rely on offsetHeight
            return height;
        }

        // Click handler for summary
        summary.addEventListener('click', function (e) {
            e.preventDefault();
            if (spoiler.hasAttribute('open')) {
                closeSpoiler(spoiler);
            } else {
                openSpoiler(spoiler);
            }
        });

        // Click handler for footer close button
        if (footer) {
            footer.addEventListener('click', function (e) {
                e.preventDefault();
                closeSpoiler(spoiler);
            });
        }
    });

    function openSpoiler(el) {
        // Set starting height
        el.style.height = el.offsetHeight + 'px';
        el.open = true; // Add open attribute to render content

        // Wait for next frame to allow content to render and calculate height
        window.requestAnimationFrame(function () {
            // Calculate target height
            // We can't just use el.scrollHeight because of potential internal sizing issues
            // So we let it expand naturally to measure, then animate

            // Alternative approach: specific calculation
            // But simplest is:
            const startHeight = el.offsetHeight;
            el.style.height = 'auto'; // Let it expand to find natural height
            const endHeight = el.offsetHeight;

            // Reset to start height to begin animation
            el.style.height = startHeight + 'px';

            // Force reflow
            void el.offsetHeight;

            // Enable transition
            el.style.transition = 'height 0.3s ease-out';
            el.style.height = endHeight + 'px';

            // Cleanup after transition
            el.addEventListener('transitionend', function transitionEnd() {
                el.style.height = 'auto';
                el.style.transition = '';
                el.removeEventListener('transitionend', transitionEnd);
            });
        });
    }

    function closeSpoiler(el) {
        const startHeight = el.offsetHeight;
        const endHeight = el.querySelector('summary').offsetHeight;

        el.style.height = startHeight + 'px';
        el.style.overflow = 'hidden'; // Ensure content is clipped

        // Force reflow
        void el.offsetHeight;

        el.style.transition = 'height 0.3s ease-out';
        el.style.height = endHeight + 'px';

        el.addEventListener('transitionend', function transitionEnd() {
            el.open = false;
            el.style.height = '';
            el.style.transition = '';
            el.style.overflow = ''; // Reset overflow
            el.removeEventListener('transitionend', transitionEnd);

            // Scroll back to summary if it's out of view (optional, but good UX)
            // const rect = el.getBoundingClientRect();
            // if (rect.top < 0) {
            //   el.scrollIntoView({ behavior: 'smooth', block: 'start' });
            // }
        });
    }
});
